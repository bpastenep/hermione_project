class AddProgramToRdaGeneral < ActiveRecord::Migration[5.1]
  def change
    add_reference :rda_generals, :program, foreign_key: true
  end
end
