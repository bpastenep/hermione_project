class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :asignacionGrupo, :boolean
    add_column :users, :grupo, :integer
  end
end
