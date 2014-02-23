class Pomodoro < ActiveRecord::Base
  def projected_end
    unless self.end.present?
      start + 25.minutes
    end
  end
end
