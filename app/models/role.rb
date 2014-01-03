class Role < ActiveRecord::Base
  #has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  has_many :user_roles
  has_many :users, :through => :user_roles

  has_many :permission_roles
  has_many :permissions,  :through => :permission_roles
  accepts_nested_attributes_for :permissions

  validates :name, {:presence => true, :uniqueness => true}


  scopify

  attr_accessible :name

  def overpower?
    return true if self.name == "Admin"
  end


end
