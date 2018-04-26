class CreateRdaGenerals < ActiveRecord::Migration[5.1]
  def change
    create_table :rda_generals do |t|
      t.text :descripcion 
      t.timestamps
    end
  end
end
