class GenresReview < ApplicationRecord
  belongs_to :genre
  belongs_to :review
end
