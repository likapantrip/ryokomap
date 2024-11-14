class CountryStatus < ApplicationRecord
  validates :status_id,  numericality: true
  validates :country_id, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :country

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end
