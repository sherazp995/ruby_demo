class Comment < StiComment
  belongs_to :user
  belongs_to :post
  has_many :replies, :class_name => "Reply"

end