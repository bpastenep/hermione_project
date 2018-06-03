class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.string :objetivo
      t.date :fecha

      t.timestamps
    end
  end
end
