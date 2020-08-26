class Place < ApplicationRecord
    geocoded_by :address
    has_many_attached :photos

    after_validation :geocode, if: :will_save_change_to_address?

    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy

    belongs_to :user
end
