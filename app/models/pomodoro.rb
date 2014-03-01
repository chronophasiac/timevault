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
    unless self.update(end: DateTime.now)
      # Something has gone wrong, just destroy the invalid pomodoro
      self.destroy
    end
  end
end
