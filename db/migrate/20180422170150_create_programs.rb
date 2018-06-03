class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :nombre
      t.string :autor
      t.text :descripcion
      t.date :fecha

      t.timestamps
    end
  end
end
