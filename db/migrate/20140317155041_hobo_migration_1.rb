class HoboMigration1 < ActiveRecord::Migration
  def self.up
    add_column :cars, :kilomiters, :integer
    add_column :cars, :model_id, :integer
    remove_column :cars, :brand_id

    remove_index :cars, :name => :index_cars_on_brand_id rescue ActiveRecord::StatementInvalid
    add_index :cars, [:model_id]
  end

  def self.down
    remove_column :cars, :kilomiters
    remove_column :cars, :model_id
    add_column :cars, :brand_id, :integer

    remove_index :cars, :name => :index_cars_on_model_id rescue ActiveRecord::StatementInvalid
    add_index :cars, [:brand_id]
  end
end
