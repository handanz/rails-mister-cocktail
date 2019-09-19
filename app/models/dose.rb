class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, :ingredient_id, :cocktail_id, presence: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
end
