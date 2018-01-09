json.extract! post, :id, :title_tag, :meta, :title, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
