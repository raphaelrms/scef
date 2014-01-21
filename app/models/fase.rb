class Fase < ActiveRecord::Base

  belongs_to :curso
  has_many :custos

  attr_accessible :orcamento, :descricao, :curso_id

end
