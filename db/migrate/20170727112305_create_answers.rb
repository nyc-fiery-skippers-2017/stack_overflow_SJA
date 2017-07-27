class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer_string, null: false
      t.references :responder_id, null: false

      t.timestamps
  end
end
