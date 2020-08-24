class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :genres_reviews
end
