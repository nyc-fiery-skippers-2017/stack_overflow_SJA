class Answer < ApplicationRecord
  # Remember to create a migration!
  belongs_to :question 
  belongs_to :responder, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :answer_string, {presence: true}
end
