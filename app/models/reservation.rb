class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :how_many, presence: true

belongs_to :user
belongs_to :room
end
