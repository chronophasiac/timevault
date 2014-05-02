class PomodoroEndWorker
  include Sidekiq::Worker

  def perform(id)
    pomodoro = Pomodoro.find(id)
    notifier = PomodoroNotifier.new(pomodoro)
    notifier.send_notification!
  end
end
