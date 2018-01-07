json.extract! page, :id, :titletag, :meta, :tile, :slug, :body, :created_at, :updated_at
json.url page_url(page, format: :json)
