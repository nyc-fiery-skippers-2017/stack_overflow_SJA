class Comment < ApplicationRecord
  # Remember to create a migration!
  belongs_to :commenter, source :user
  belongs_to :comment, polymorphic: :true

  validates :comment, {presence: true}
end
