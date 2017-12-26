class Facility < ApplicationRecord
  # TYPES = ["Restroom", "Nursing Room", "Family Room", "Makeup Room", "Accessible Room"]
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :types, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
