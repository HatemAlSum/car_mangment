class Driver < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name               :string
    birth_date         :date
    national_id        :string
    driving_licence_no :string
    expiration_date    :date
    telephone          :string
    note               :text
    timestamps
  end
  attr_accessible :name, :birth_date,  :driving_licence_no, :expiration_date, :note ,:national_id,:telephone

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
