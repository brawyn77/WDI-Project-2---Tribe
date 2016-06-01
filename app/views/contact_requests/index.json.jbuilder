json.array!(@contact_requests) do |contact_request|
  json.extract! contact_request, :id
  json.url contact_request_url(contact_request, format: :json)
end
