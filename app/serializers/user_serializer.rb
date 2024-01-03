# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  has_many :products

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 12.hours
end
