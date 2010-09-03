class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :owner
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
