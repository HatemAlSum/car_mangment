class Model < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string , :required,:unique
    cars_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :name, :brand, :brand_id
  belongs_to :brand, :inverse_of => :models, :counter_cache => true
  has_many :cars, :dependent => :destroy, :inverse_of => :model
  children :cars
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
