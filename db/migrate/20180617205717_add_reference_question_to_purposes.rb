class AddReferenceQuestionToPurposes < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :purpose, foreign_key: true
  end
end
