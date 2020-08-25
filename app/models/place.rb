class Place < ApplicationRecord
    geocoded_by :address

    after_validation :geocode, if: :will_save_change_to_address?

    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
