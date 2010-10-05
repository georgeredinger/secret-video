class AddPlayerToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :player, :string
  end

  def self.down
    remove_column :videos, :player
  end
end
