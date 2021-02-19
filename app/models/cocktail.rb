class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, :image_url, :description, uniqueness: true, presence: true, allow_blank: false
end
