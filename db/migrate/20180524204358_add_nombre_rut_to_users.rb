class AddNombreRutToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombreC, :string
    add_column :users, :rut, :string
  end
end
