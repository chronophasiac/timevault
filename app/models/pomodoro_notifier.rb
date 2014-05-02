class PomodoroNotifier
  def initialize(pomodoro)
    @pomodoro = pomodoro
  end

  def send_notification!
    if @pomodoro.update(end: DateTime.now)
      account_sid = 'AC0392a7666e358b617c37331aa14b0b3c'
      auth_token = '50a8977da9b70fdfcfeec6524561103b'

      client = Twilio::REST::Client.new account_sid, auth_token
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
