class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :pizza
end
