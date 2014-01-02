class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  has_many :users
  has_and_belongs_to_many :permissions,  :join_table => :permissions_roles

  validates :name, {:presence => true, :uniqueness => true}

  scopify

  attr_accessible :name

  def overpower?
    return true if self.name == "Admin"
  end


end
