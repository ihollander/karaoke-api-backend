class AddPlayedToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :played, :boolean, default: false
  end
end
