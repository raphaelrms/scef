class Role < ActiveRecord::Base
  #has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  has_many :user_roles
  has_many :users, :through => :user_roles

  has_many :permission_roles
  has_many :permissions,  :through => :permission_roles
  accepts_nested_attributes_for :permissions

  validates :name, {:presence => true, :uniqueness => true}
  before_destroy :tratar_usuarios_orfaos,:evitar_delecao_visitante

  scopify

  attr_accessible :name

  def overpower?
    return true if self.name == "Admin"
  end

  #Todos os usuários terão seu grupo alterado pra visitante, se um grupo for deletado
  def tratar_usuarios_orfaos
    UserRole.update_all({:role_id => Role.where(:name => "Visitante").first},{:role_id => self})
  end

  def evitar_delecao_visitante
    
  end

end
