class AddOptionToTmp < ActiveRecord::Migration[5.1]
  def change
    add_column :tmps, :a, :string
    add_column :tmps, :b, :string
    add_column :tmps, :c, :string
    add_column :tmps, :d, :string
  end
end
