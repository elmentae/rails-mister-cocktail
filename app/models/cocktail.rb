class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates :name, :description, uniqueness: true, presence: true, allow_blank: false
end
