class AddFlagToTmp < ActiveRecord::Migration[5.1]
  def change
    add_column :tmps, :flagAlternativas, :boolean
  end
end
