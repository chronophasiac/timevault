class Pomodoro < ActiveRecord::Base
  def projected_end
    unless self.end.present?
      start + 25.minutes
    end
  end

  def schedule_end
    PomodoroEndWorker.perform_in(set_duration.seconds.from_now, id)
  end

  def add_end
    self.end = ->{DateTime.now}.call
    self.save
  end
end
