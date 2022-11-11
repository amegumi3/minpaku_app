class Room < ApplicationRecord
  validates :name,presence: true
  validates :adress,presence: true
  validates :price,presence: true
  validates :introduction,presence: true,length:{maximum:200}
  has_one_attached :room_image
  belongs_to :user
  has_many :reservations
end
