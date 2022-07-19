json.extract! food, :id, :name, :price, :contents, :created_at, :updated_at
json.url food_url(food, format: :json)
