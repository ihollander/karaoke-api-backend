class User < ApplicationRecord
  belongs_to :room
  has_many :playlists, dependent: :destroy
  has_many :songs, through: :playlists

  validates :name, uniqueness: { scope: :room, message: "Unique names required per room" }
end
