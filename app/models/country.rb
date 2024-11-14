class Country < ApplicationRecord
  with_options presence: true do
    validates :country_name
    validates :classification
  end
end
