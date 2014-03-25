class Maintenance < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title          :string
    purpose        :text
    cost           :integer
    center_name    :string
    center_address :text
    center_phone   :string
    timestamps
  end
  attr_accessible :title, :purpose, :cost, :center_name, :center_address, :center_phone,:car,:car_id, :maintenance_category , :maintenance_category_id


  belongs_to :car
  belongs_to :maintenance_category
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
