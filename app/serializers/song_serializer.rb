class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :youtube_id
end
