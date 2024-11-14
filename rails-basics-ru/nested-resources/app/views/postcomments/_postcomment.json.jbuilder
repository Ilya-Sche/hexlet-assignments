json.extract! postcomment, :id, :body, :post_id, :created_at, :updated_at
json.url postcomment_url(postcomment, format: :json)
