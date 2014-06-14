json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :video_id, :caption
  json.url post_url(post, format: :json)
end
