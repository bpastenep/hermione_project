class CreatePurposeQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :purpose_questions do |t|
      t.references :purpose, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
