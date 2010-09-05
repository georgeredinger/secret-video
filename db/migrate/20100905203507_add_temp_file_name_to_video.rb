class AddTempFileNameToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :temp_file_name, :string
  end

  def self.down
    remove_column :videos, :temp_file_name
  end
end
