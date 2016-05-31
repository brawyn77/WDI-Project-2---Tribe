json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :username, :address, :postcode, :search_radius, :sex, :interests
  json.url profile_url(profile, format: :json)
end
