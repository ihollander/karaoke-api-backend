class AddSortToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :sort, :integer, default: 0
  end
end
