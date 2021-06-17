class Movie < ApplicationRecord
  has_many :categorisation, dependent: :destroy
  has_many :category, through: :categorisation
end
