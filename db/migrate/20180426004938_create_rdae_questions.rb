class CreateRdaeQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :rdae_questions do |t|
      t.references :rda_especific, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
