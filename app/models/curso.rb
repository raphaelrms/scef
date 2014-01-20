class Curso < ActiveRecord::Base

  has_many :editals
  has_many :fases

  attr_accessible :nome, :descricao, :ano

end
