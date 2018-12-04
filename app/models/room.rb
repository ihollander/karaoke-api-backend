class Room < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :playlists, through: :users
  has_many :songs, through: :playlists
end
