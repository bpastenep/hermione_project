class CreatePurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :purposes do |t|
      t.text :descripcion
      t.references :rda_especific, foreign_key: true

      t.timestamps
    end
  end
end
