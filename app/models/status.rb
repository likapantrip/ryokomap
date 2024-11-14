class Status < ActiveHash::Base
  self.data = [
    { id: 10, status: '住んだ' },
    { id: 20, status: '旅行した' },
    { id: 30, status: '立ち寄った' },
    { id: 40, status: '行ってない' }
  ]

  include ActiveHash::Associations
	has_many :country_statuses
end