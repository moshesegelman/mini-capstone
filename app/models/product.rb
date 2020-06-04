class Product < ApplicationRecord

  validates :name, uniqueness: true, length: { in: 1...100}
  validates :price, presence: true, numericality: {gretaer_than: 0}
  validates :description, length: {10..500}
  

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
