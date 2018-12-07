class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :song_id, :sort, :played

  belongs_to :song
  belongs_to :user
end
