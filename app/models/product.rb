# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :orders, through: :placements

  scope :filter_by_title, ->(keyword) { where('lower(title) LIKE ?', "%#{keyword.downcase}%") }

  scope :above_or_equal_to_price, ->(price) { where('price >= ?', price) }
  scope :below_or_equal_to_price, ->(price) { where('price <= ?', price) }

  scope :recent, -> { order(:updated_at) }

  def self.search(params = {})
    products = if params[:product_ids].present?
                 Product.where(
                   id: params[:product_ids]
                 )
               else
                 Product.all
               end

    if params[:keyword]
      products = products.filter_by_title(
        params[:keyword]
      )
    end
    if params[:min_price]
      products = products.above_or_equal_to_price(
        params[:min_price].to_f
      )
    end
    if params[:max_price]
      products = products.below_or_equal_to_price(
        params[:max_price].to_f
      )
    end
    products.recent if params[:recent]

    products
  end
end
