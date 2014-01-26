# encoding: utf-8

class PermissionRole < ActiveRecord::Base
  attr_accessible :permission_id,:role_id
  belongs_to :permission
  belongs_to :role

  before_destroy :consistencia_de_acoes_ao_remover
  after_create :consistencia_de_acoes_ao_adicionar

  def consistencia_de_acoes_ao_remover
    case
    self.permission.action
      when "new"
        permissao = PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create", :subject_class => self.permission.subject_class)).first
        permissao.delete.save if !permissao.nil?
      when "create"
        permissao = PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "new", :subject_class => self.permission.subject_class)).first
        permissao.delete.save if !permissao.nil?
      when "edit"
        permissao = PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update", :subject_class => self.permission.subject_class)).first
        permissao.delete.save if !permissao.nil?
      when "update"
        permissao = PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update", :subject_class => self.permission.subject_class)).first
        permissao.delete.save if !permissao.nil?
    end
  end

  def consistencia_de_acoes_ao_adicionar
    case self.permission.action
      when "new"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create", :subject_class => self.permission.subject_class).first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create", :subject_class => self.permission.subject_class).first).any?
      when "create"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "new", :subject_class => self.permission.subject_class).first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "new", :subject_class => self.permission.subject_class).first).any?
      when "edit"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update", :subject_class => self.permission.subject_class).first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update", :subject_class => self.permission.subject_class).first).any?
      when "update"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "edit", :subject_class => self.permission.subject_class).first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "edit", :subject_class => self.permission.subject_class).first).any?
    end
  end



end