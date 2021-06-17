class Categorisation < ApplicationRecord
  belongs_to :category
  belongs_to :movie
end
