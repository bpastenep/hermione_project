class CreateRdaEspecifics < ActiveRecord::Migration[5.1]
  def change
    create_table :rda_especifics do |t|
      t.text :descripcion
      t.references :rda_general, foreign_key: true
      t.timestamps
    end
  end
end
