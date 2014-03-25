class Addtelephonetodriver < ActiveRecord::Migration
  def self.up
    add_column :drivers, :telephone, :string
  end

  def self.down
    remove_column :drivers, :telephone
  end
end
