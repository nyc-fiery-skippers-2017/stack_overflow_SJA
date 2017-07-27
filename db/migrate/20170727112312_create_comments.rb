class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_string, null: false
      t.references :commentable_id, null: false
      t.references :commentable_type, null: false
      t.references :commenter_id

      t.timestamps
    end
  end
end
