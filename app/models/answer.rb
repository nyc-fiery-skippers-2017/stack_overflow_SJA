class Answer < ApplicationRecord
  # Remember to create a migration!
  belongs_to :responder, source :user
  has_many :comments, as: :commentable

  validates :answer, {presence: true}
end
