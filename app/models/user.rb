class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :user_roles
  has_many :roles, :through => :user_roles
  accepts_nested_attributes_for :roles

  before_validation :grupo_padrao

  delegate :permissions, :to => :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_id

  def grupo_padrao
    self.roles  << Role.where(:name => "Visitante").first if !self.roles.any?
  end






end

