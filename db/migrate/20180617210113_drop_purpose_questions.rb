class DropPurposeQuestions < ActiveRecord::Migration[5.1]
  def change
  	drop_table :purpose_questions
  	drop_table :course_evaluations
  end
end
