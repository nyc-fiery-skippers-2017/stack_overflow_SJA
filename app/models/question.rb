class Question < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  has_many :answers 
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable


  validates :title, :body, {presence: true}
end
