class CreateTmps < ActiveRecord::Migration[5.1]
  def change
    create_table :tmps do |t|
      t.integer :evaluationActive_id
      t.integer :program_id

      t.timestamps
    end
  end
end
