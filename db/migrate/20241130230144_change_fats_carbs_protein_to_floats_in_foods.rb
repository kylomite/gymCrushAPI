class ChangeFatsCarbsProteinToFloatsInFoods < ActiveRecord::Migration[7.1]
  def change
    change_column :foods, :fats, :float
    change_column :foods, :carbs, :float
    change_column :foods, :protein, :float
  end
end
