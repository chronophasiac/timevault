class PomodoroFactory

  attr_reader :model

  def initialize(user, attributes = {})
    attributes[:start] = DateTime.now
    @model = user.pomodoros.build(attributes)
  end

  def save
    Pomodoro.transaction do
      @model.save!
      @model.update! job_id: PomodoroEndWorker.perform_in(@model.set_duration.seconds.from_now, @model.id)
    end
    true
  rescue ActiveRecord::ActiveRecordError
    @model.delete_queued_job!
    false
  end

end
