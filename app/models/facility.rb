class Facility < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :types, inclusion: { in: ["Restroom", "Nursing Room", "Family Room", "Makeup Room", "Accessible Room"], allow_nil: false}
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
