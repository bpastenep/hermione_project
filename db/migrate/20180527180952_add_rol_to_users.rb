class AddRolToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rol, :string
  end
end
