class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
