class CreateEvaluationTemporals < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_temporals do |t|
      t.string :objetivo

      t.timestamps
    end
  end
end
