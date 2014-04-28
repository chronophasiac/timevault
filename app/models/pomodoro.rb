class Pomodoro < ActiveRecord::Base
  belongs_to :user,
             inverse_of: :pomodoros

  enum activity: {
    work: 0,
    break: 1
  }

  validates :user, presence: true
  validates :start, presence: true
  validates :set_duration, presence: true, numericality: { greater_than_or_equal_to: 10 }
  validates :activity, presence: true

  def schedule_end
    PomodoroEndWorker.perform_in(set_duration.seconds.from_now, id)
  end

  def add_end
    if self.update(end: DateTime.now)
      notifier = PomodoroNotifier.new(self)
      notifier.send_notification!
    else
      # Something has gone seriously wrong, just destroy the invalid pomodoro
      self.destroy
    end
  end
end
