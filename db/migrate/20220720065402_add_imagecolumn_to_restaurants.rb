class AddImagecolumnToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :restaurant_image, :attachment
  end
end
