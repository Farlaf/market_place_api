# frozen_string_literal: true

class OrderSerializer
  include JSONAPI::Serializer
  belongs_to :user
  has_many :products

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 12.hours
end
