class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.string :user_agent
      t.string :file_name
      t.string :delivery
      t.string :player
      t.integer :success
      t.integer :failure

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
