class AddNewValuesToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :respuesta_incorrecta2, :string
    add_column :questions, :respuesta_incorrecta3, :string
  end
end
