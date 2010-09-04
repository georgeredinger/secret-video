class AddDeliveryToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :delivery, :string
  end

  def self.down
    remove_column :videos, :delivery
  end
end
