#coding: UTF-8
class Fase < ActiveRecord::Base

  belongs_to :curso
  has_many :custos, :dependent => :destroy
  has_many :categorias

  validates :curso,  :presence => true

  attr_accessible :orcamento,:descricao,:curso_id,:curso,:inicio_periodo,:fim_periodo

  scope :comecando, lambda { |inicio|
    where("inicio_periodo >= '#{inicio}'")
  }

  scope :finalizando, lambda { |fim|
    where("fim_periodo <= '#{fim}'")
  }

  scope :da_permissao, lambda { |permissao|
    joins(:noticias_permissoes).where(:noticias_permissoes => {:permissao => permissao})
  }


  def self.total_custos(fase_id)
    Custo.select("sum(valor*quantidade) as total").where(:fase_id=>fase_id)
  end

  def custo_total
    self.custos.collect { |c| c.valor }.sum
  end

end
