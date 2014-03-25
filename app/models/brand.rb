class Brand < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :required ,:unique
    models_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :name, :models
  has_many :models, :dependent => :destroy, :inverse_of => :brand
  children :models
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
