class Movements < ActiveRecord::Migration
  def self.up
    create_table :branches do |t|
      t.string   :name
      t.text     :address
      t.string   :contact_person
      t.string   :contact_phone
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :car_movements do |t|
      t.string   :title
      t.datetime :from_time
      t.datetime :to_time
      t.integer  :km_before
      t.integer  :km_after
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :car_id
      t.integer  :driver_id
    end
    add_index :car_movements, [:car_id]
    add_index :car_movements, [:driver_id]

    create_table :maintenances do |t|
      t.string   :title
      t.text     :purpose
      t.integer  :cost
      t.string   :center_name
      t.text     :center_address
      t.string   :center_phone
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :car_id
      t.integer  :maintenance_category_id
    end
    add_index :maintenances, [:car_id]
    add_index :maintenances, [:maintenance_category_id]

    create_table :maintenance_categories do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :cars, :board_number, :string
  end

  def self.down
    remove_column :cars, :board_number

    drop_table :branches
    drop_table :car_movements
    drop_table :maintenances
    drop_table :maintenance_categories
  end
end
