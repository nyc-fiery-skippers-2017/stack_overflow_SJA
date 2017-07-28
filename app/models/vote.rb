class Vote < ApplicationRecord
  # Remember to create a migration!
  belongs_to :voter, class_name: "User"
  belongs_to :voteable, polymorphic: true

  validates :vote_choice, {presence: true}#not sure what to do here
end
