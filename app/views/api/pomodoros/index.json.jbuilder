json.array!(@pomodoros) do |pomodoro|
  json.extract! pomodoro, :id, :start, :end, :set_duration, :activity
  json.url api_pomodoro_url(pomodoro, format: :json)
end
