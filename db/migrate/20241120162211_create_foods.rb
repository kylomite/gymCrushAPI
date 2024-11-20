class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :title
      t.string :image
      t.string :serving_size
      t.integer :calories
      t.integer :fats
      t.integer :carbs
      t.integer :protein

      t.timestamps
    end
  end
end
