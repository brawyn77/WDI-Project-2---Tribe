json.array!(@posts) do |post|
  json.extract! post, :id, :user_from, :user_to, :message
  json.url post_url(post, format: :json)
end
