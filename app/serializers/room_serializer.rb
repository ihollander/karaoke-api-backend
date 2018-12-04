class RoomSerializer < ActiveModel::Serializer
  attributes :id

  has_many :users
  has_many :songs
end
