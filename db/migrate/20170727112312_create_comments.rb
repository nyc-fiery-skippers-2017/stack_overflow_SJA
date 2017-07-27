class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_string, null: false
      t.references :commentable, polymorphic: true, index: true
      # t.references :commentable_type, index: true
      t.references :commenter, index: true

      t.timestamps
    end
  end
end
