class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string   :name
      t.integer  :models_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :models do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :brand_id
    end
    add_index :models, [:brand_id]
  end

  def self.down
    drop_table :brands
    drop_table :models
  end
end
