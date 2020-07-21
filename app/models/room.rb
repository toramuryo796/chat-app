class Room < ApplicationRecord
  has_many :room_users
  has_many :users, trhough: :room_users
end
