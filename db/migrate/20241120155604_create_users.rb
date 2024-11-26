class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :sex
      t.float :weight_lbs
      t.integer :height_ft
      t.integer :height_in
      t.integer :age
      t.integer :activity_level
      t.integer :target_calories
      t.integer :target_fats
      t.integer :target_carbs
      t.integer :target_protein

      t.timestamps
    end
  end
end
