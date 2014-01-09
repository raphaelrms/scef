# encoding: utf-8
class Permission < ActiveRecord::Base
  has_many :permission_roles
  has_many :roles, :through => :permission_roles

  validate :unicidade_acao_classe

  before_create :titlecasear_classe
  before_create :acoes_possiveis

  attr_accessible :action, :subject_class, :subject_id

  def unicidade_acao_classe
    if Permission.where(:action => self.action, :subject_class => self.subject_class).any?
      errors.add(:action, "já está cadastrado para a a classe #{self.subject_class.mb_chars.titlecase.to_s}")
      return false
    end

  end

  def titlecasear_classe
    self.subject_class = self.subject_class.mb_chars.titlecase.to_s
  end

  def acoes_possiveis
      if !['create','new', 'show' ,'read','index','update','destroy'].include? self.action
      errors.add(:action,"só pode ser: create, new, read, index, update, destroy")
      return false
    end
  end

end
