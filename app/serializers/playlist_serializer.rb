class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :song_id, :sort

  belongs_to :song
  belongs_to :user
end
