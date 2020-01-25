class Product < ApplicationRecord
  before_save(:titleize_product)
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
    )}
    scope :ten_most_recent, -> { order(created_at: :desc).limit(3)}
    scope :search, -> (location_parameter) { where("country_of_origin like ?", "%#{location_parameter}%")}
    private
    def titleize_product

      self.name = self.name.titleize
    end
  end
