class Branch < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name           :string
    address        :text
    contact_person :string
    contact_phone  :string
    timestamps
  end
  attr_accessible :name, :address, :contact_person, :contact_phone

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
