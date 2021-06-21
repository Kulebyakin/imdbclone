class Category < ApplicationRecord
  has_many :categorisation
  has_many :movies, -> { distinct }, through: :categorisation
end
