class Answer < ApplicationRecord
  # Remember to create a migration!
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :answer_string, {presence: true}
end
