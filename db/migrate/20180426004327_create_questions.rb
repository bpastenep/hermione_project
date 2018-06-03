class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :tipo_pregunta
      t.text :enunciado
      t.text :respuesta
      t.text :respuestas_incor

      t.timestamps
    end
  end
end
