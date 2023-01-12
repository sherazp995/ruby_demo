json.extract! sti_comment, :id, :text, :user_id, :post_id, :type, :created_at, :updated_at
json.url sti_comment_url(sti_comment, format: :json)
