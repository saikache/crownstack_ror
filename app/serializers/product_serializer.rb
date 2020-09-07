class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :make, :available_quantity
end
