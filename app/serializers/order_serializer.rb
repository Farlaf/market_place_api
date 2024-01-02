# frozen_string_literal: true

class OrderSerializer
  include JSONAPI::Serializer
  belongs_to :user
  has_many :products
end