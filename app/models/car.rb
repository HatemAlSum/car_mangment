class Car < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name            :string, :required
    board_number    :string, :required
    file_id         :string
    model_year      :string , :required
    licence_no      :string , :required
    chase_no        :string , :required
    color           :string , :required
    motor_size      :integer, :required
    expiration_date :date   , :required
    kilomiters      :integer, :required

    notes           :text
    timestamps
  end
  attr_accessible :name,:board_number, :file_id, :model_year, :licence_no, :chase_no, :color, :motor_size, :expiration_date,:kilomiters, :notes, :model,:model_id
  belongs_to :model #, :inverse_of => :cars, :counter_cache => true
  has_many :maintenances, :dependent => :destroy, :inverse_of => :car
  children :maintenances

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
