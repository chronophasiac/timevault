class Pomodoro < ActiveRecord::Base

  belongs_to :user,
             inverse_of: :pomodoros

  enum activity: {
    work: 0,
    break: 1
  }

  before_destroy :delete_queued_job!

  QUEUE = Sidekiq::ScheduledSet.new

  validates :user, presence: true
  validates :start, presence: true
  validates :set_duration, presence: true, numericality: { greater_than_or_equal_to: 10 }
  validates :activity, presence: true

  def add_end
    if self.update(end: DateTime.now)
      notifier = PomodoroNotifier.new(self)
      notifier.send_notification!
    else
      # Something has gone seriously wrong, just destroy the invalid pomodoro
      self.destroy
    end
  end

  def delete_queued_job!
    if job_id.present?
      queue.each { |job| job.delete if job.jid == job_id }
    end
  end

  private

  def queue
    QUEUE
  end

end
