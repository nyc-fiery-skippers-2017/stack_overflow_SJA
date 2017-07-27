class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote, default: false
      t.references :votable_id, null: false
      t.references :votable_type, null: false
      t.references :voter_id, null:false

      t.timestamps
    end
  end
end
