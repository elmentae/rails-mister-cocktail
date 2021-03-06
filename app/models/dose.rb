class Dose < ApplicationRecord
  belongs_to :cocktail, required: true
  belongs_to :ingredient, required: true

  validates :description, presence: true, allow_blank: false
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
end
