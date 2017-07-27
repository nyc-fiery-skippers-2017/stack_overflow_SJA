class User < ApplicationRecord
  # Remember to create a migration!
  #this is up for edit when we include the polymorphic associations.
  has_many :questions, :answers, :comments, :votes
  has_many :votes, as: :voteable

  validates :username, :email, :password, {presence: true}
  validates :email, {uniqueness: true}

  has_secure_password
end
