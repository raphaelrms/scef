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

  VISITANTE = "Visitante"
  ADMIN = "Admin"

  attr_accessible :name
  scope :sem_redundancias, lambda {binding.pry}

def self.permissoes_associadas
  Role.find_each do |r| @a = r.permissions end
  return @a
end


  def overpower?
    return true if self.name == ADMIN
  end



  #Todos os usuários terão seu grupo alterado pra visitante, se um grupo for deletado
  def tratar_usuarios_orfaos
    UserRole.update_all({:role_id => Role.where(:name => VISITANTE).first},{:role_id => self})
  end

  def evitar_delecao_visitante
    return false if self.name == VISITANTE
  end

end
