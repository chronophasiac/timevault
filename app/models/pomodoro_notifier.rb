class PomodoroNotifier

  def initialize(pomodoro)
    @pomodoro = pomodoro
  end

  def send_notification!
    if @pomodoro.update(end: DateTime.now)
      client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid,
                                        Rails.application.secrets.twilio_auth_token)

      client.account.messages.create(
        from: '+16175003913',
        to: @pomodoro.user.phone_number,
        body: 'Pomodoro complete!'
      )
    else
      # Something has gone seriously wrong, just destroy the invalid pomodoro
      @pomodoro.destroy
    end
  end
  
end
