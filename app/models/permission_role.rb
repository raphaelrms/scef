class PermissionRole < ActiveRecord::Base
  attr_accessible :permission_id,:role_id
  belongs_to :permission
  belongs_to :role

  before_destroy :consistencia_de_acoes_ao_remover
  after_create :consistencia_de_acoes_ao_adicionar

  scope :sem_redundancias, lambda {

    Role.find_each do |p|
      p.permissions.find_each do |x|
        binding.pry
      end
    end

  }

  def consistencia_de_acoes_ao_remover
    case self.permission.action
      when "new"
        PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).first.destroy if PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "create"
        PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "new").first.id).first.destroy if PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "edit"
        PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update").first.id).first.destroy if PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "update"
        PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "edit").first.id).first.destroy if PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
    end
  end

  def consistencia_de_acoes_ao_adicionar
    case self.permission.action
      when "new"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "create"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "new").first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "edit"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "update").first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
      when "update"
        PermissionRole.new(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "edit").first.id).save if !PermissionRole.where(:role_id => self.role_id,:permission_id => Permission.select(:id).where(:action => "create").first.id).any?
    end
  end



end