class User < ApplicationRecord
  belongs_to :room
  has_many :playlists
  has_many :songs, through: :playlists
end
