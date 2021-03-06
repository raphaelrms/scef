class Curso < ActiveRecord::Base

  has_many :arquivos, :as => :anexo, :dependent => :destroy

  has_many :fases, :dependent => :destroy

  attr_accessible :nome, :descricao, :ano, :descricao, :anexo_attributes,:arquivos_attributes,:fases_attributes

  accepts_nested_attributes_for :arquivos

  scope :ordenado_por_nome, order('nome asc')
  #validates :arquivos, :length => { :minimum => 1 }
  #
  #def file_field_blank?(attributed)
  #  attributed["arquivo"].blank?
  #end

end
