class Song < ApplicationRecord
  has_many :playlists, dependent: :destroy
  has_many :users, through: :playlists
end
