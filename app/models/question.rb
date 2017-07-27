class Question < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  
  validates :title, :body, {presence: true}
end
