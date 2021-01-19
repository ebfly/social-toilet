class Map < ApplicationRecord
  belongs_to :toilet

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
