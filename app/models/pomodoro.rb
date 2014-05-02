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

  def delete_queued_job!
    queue.each { |job| job.delete if job.jid == job_id }
  end

  private

  def queue
    QUEUE
  end

end
