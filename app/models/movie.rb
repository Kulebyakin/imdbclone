class Movie < ApplicationRecord
  has_many :categorisation, dependent: :destroy
  has_many :category, through: :categorisation
  has_many :ratings, dependent: :destroy
  has_many :users, through: :rating

  validates :title, presence: true
  validates :category, presence: true

  scope :paginate, -> (page:, per_page:) {
    page = (page || 1).to_i

    limit(per_page).offset((page - 1) * per_page)
  }
end
