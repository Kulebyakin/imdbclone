class Category < ApplicationRecord
  has_many :categorisation
  has_many :movies, through: :categorisation
end
