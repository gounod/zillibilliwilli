json.array!(@users) do |user|
  json.extract! user, :id, :gender, :first_name, :last_name, :apartment, :email
  json.url user_url(user, format: :json)
end
