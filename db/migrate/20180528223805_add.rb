class Add < ActiveRecord::Migration[5.1]
  def change
  	add_column :tmps, :correctAlternative, :string
  	add_column :tmps, :flagAnswer, :boolean
  end
end
