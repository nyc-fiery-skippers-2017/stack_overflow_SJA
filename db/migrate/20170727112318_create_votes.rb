class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote_choice
      t.references :voteable, polymorphic: true, index: true
      t.references :voter, index: true

      t.timestamps
    end
  end
end
