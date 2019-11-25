class Api::OfferSerializer < ActiveModel::Serializer
  attribute :id
  attribute :title
  attribute :description
  attribute :price
end
