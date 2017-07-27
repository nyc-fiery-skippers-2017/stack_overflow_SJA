class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote, default: false
      t.references :votable, polymorphic: true, index: true
      # t.references :votable_type, index: true
      t.references :voter, index: true

      t.timestamps
    end
  end
end
