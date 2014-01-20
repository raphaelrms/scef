class Curso < ActiveRecord::Base

  has_many :arquivos
  has_many :fases

  attr_accessible :nome, :descricao, :ano

end
