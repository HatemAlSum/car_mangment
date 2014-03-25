class AddModelToCar < ActiveRecord::Migration
  def self.up
    add_column :models, :cars_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :models, :cars_count
  end
end
