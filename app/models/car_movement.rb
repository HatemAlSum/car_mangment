class CarMovement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title       :string
    from_time   :datetime
    to_time     :datetime
    km_before   :integer
    km_after    :integer
    description :text
    timestamps
  end
  attr_accessible :title, :from_time, :to_time, :km_before, :km_after, :description,:car,:car_id,:driver,:driver_id
  belongs_to :car
  belongs_to :driver
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
