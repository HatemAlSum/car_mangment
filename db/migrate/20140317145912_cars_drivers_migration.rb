class CarsDriversMigration < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string   :name
      t.string   :file_id
      t.string   :model_year
      t.string   :licence_no
      t.string   :chase_no
      t.string   :color
      t.integer  :motor_size
      t.date     :expiration_date
      t.text     :notes
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :brand_id
    end
    add_index :cars, [:brand_id]

    create_table :drivers do |t|
      t.string   :name
      t.date     :birth_date
      t.string   :national_id
      t.string   :driving_licence_no
      t.date     :expiration_date
      t.text     :note
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :cars
    drop_table :drivers
  end
end
