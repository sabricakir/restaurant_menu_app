class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.string :contents
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
