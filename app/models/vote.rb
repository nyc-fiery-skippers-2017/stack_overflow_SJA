class Vote < ApplicationRecord
  # Remember to create a migration!
  belongs_to :voter, source :user
  belongs_to :vote, polymorphic: :true

  validates :vote, {presence: true}#not sure what to do here
end
