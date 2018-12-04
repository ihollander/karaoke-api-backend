class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :song_id

  belongs_to :song
  belongs_to :user
end
