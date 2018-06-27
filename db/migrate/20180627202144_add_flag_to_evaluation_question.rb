class AddFlagToEvaluationQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluation_questions, :flagquestioninsitu, :boolean
  end
end
