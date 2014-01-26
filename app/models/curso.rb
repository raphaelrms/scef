class Curso < ActiveRecord::Base

  has_many :arquivos, :as => 'anexo', :dependent => :destroy

  has_many :fases

  attr_accessible :nome, :descricao, :ano, :arquivos_attributes,:arquivos, :descricao

  accepts_nested_attributes_for :arquivos
  #validates :arquivos, :length => { :minimum => 1 }
  #
  #def file_field_blank?(attributed)
  #  attributed["arquivo"].blank?
  #end

end
