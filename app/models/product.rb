class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
  validates :sku, presence: true, uniqueness: true

  before_save :clean_spaces

  private
    def clean_spaces
      self.name = name.strip
      self.quantity = quantity.strip
    end
end
