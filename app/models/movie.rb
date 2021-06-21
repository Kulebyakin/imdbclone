class Movie < ApplicationRecord
  has_many :categorisation, dependent: :destroy
  has_many :category, -> { distinct }, through: :categorisation
  has_many :ratings, dependent: :destroy
  has_many :users, -> { distinct }, through: :rating
end
