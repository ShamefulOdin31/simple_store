class Product < ApplicationRecord
  validates :title, :price, :stock_qauntity, presence: true
end
