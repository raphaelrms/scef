class Curso < ActiveRecord::Base

  has_many :arquivos, :dependent => :destroy
  has_many :fases

  attr_accessible :nome, :descricao, :ano, :arquivos_attributes

  accepts_nested_attributes_for :arquivos, :reject_if => :file_field_blank?
  #validates :arquivos, :length => { :minimum => 1 }
  #
  #def file_field_blank?(attributed)
  #  attributed["arquivo"].blank?
  #end

end
