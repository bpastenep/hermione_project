class AddReferencesPurposeToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :purpose, foreign_key: true
  end
end
