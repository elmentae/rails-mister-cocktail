class Cocktail < ApplicationRecord
  validates :name, uniqueness: true
end
