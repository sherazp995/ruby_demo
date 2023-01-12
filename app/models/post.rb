class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :class_name => "Comment",dependent: :destroy

end
