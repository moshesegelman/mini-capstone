class Product < ApplicationRecord

  validates :name, uniqueness: true, length: { in: 1...100}
  validates :price, presence: true, numericality: {gretaer_than: 0}
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :orders, through: :carted_products

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def category_names
    categories.map {|category| category.name}
  end

end
