class User < ApplicationRecord
  # Remember to create a migration!
  #this is up for edit when we include the polymorphic associations.
  has_many :questions
  has_many :answers
  # has_many :comments, as: :commentable
   has_many :comments
   has_many :votes
  # g

  validates :username, :email, :password, {presence: true}
  validates :email, {uniqueness: true}

  has_secure_password
end
