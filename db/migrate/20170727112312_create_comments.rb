class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_string, null: false
      t.references :commentable_id, index: true
      t.references :commentable_type, index: true
      t.references :commenter_id, index: true

      t.timestamps
    end
  end
end
