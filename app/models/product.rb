class Product < ApplicationRecord
  validates :title, :price, :stock_qauntity, presence: true
  has_many :Categories
end
