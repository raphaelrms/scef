class Permission < ActiveRecord::Base
  has_many :permission_roles
  has_many :roles, :through => :permission_roles



  attr_accessible :action, :subject_class, :subject_id
end
