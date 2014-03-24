class Pomodoro < ActiveRecord::Base
  belongs_to :user,
             inverse_of: :pomodoros

  validates :start, presence: true
  validates :set_duration, presence: true
  validates :user, presence: true

  def projected_end
    unless self.end.present?
      start + 25.minutes
    end
  end

  def schedule_end
    PomodoroEndWorker.perform_in(set_duration.seconds.from_now, id)
  end

  def add_end
    if self.update(end: DateTime.now)
      send_notification!
    else
      # Something has gone seriously wrong, just destroy the invalid pomodoro
      self.destroy
    end
  end

  private

  def send_notification!
    account_sid = 'AC0392a7666e358b617c37331aa14b0b3c'
    auth_token = '50a8977da9b70fdfcfeec6524561103b'

    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(
      from: '+16175003913',
      to: user.phone_number,
      body: 'Pomodoro complete!'
    )
  end
end
