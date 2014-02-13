json.array!(@intervals) do |interval|
  json.extract! interval, :id, :start, :end
  json.url interval_url(interval, format: :json)
end
