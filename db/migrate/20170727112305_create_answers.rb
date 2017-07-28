class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer_string, null: false
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
