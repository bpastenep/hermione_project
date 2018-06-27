class CreateAnswerTemporals < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_temporals do |t|
      t.references :question, foreign_key: true
      t.integer :user_id
      t.string :answer
      t.boolean :correct
      t.string :alternativa
      t.integer :purpose_id

      t.timestamps
    end
  end
end
