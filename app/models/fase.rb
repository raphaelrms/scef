#coding: UTF-8
class Fase < ActiveRecord::Base

  belongs_to :curso
  has_many :custos, :dependent => :destroy

  validates :curso,  :presence => true

  attr_accessible :orcamento,:descricao,:curso_id,:curso

  def self.total_custos(fase_id)
    Custo.select("sum(valor*quantidade) as total").where(:fase_id=>fase_id)
  end

end
