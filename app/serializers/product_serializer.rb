# frozen_string_literal: true

class ProductSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :published
  belongs_to :user
end
