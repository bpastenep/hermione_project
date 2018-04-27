class CreateEvaluationQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_questions do |t|
      t.references :question, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.boolean :logrado

      t.timestamps
    end
  end
end
