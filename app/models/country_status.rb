class CountryStatus < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :country_id
    validates :status_id
  end

  validates :status_id,  numericality: true
  validates :country_id, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :country

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end
