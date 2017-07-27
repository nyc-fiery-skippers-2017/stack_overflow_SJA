class Comment < ApplicationRecord
  # Remember to create a migration!
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
  

  validates :comment_string, {presence: true}
end
