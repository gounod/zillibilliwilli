json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :title, :description, :user, :state
  json.url discussion_url(discussion, format: :json)
end
