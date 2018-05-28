class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
