class PomodoroEndWorker
  include Sidekiq::Worker

  def perform(id)
    pomodoro = Pomodoro.find(id)
    pomodoro.add_end if pomodoro.present?
  end
end
