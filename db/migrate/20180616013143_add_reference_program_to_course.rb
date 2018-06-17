class AddReferenceProgramToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :program, foreign_key: true
  end
end
