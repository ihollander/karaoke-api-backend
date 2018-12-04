class Room < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :songs, through: :users
end
