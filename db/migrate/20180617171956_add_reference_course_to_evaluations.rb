class AddReferenceCourseToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_reference :evaluations, :course, foreign_key: true
  end
end
