class Permission < ActiveRecord::Base
  belongs_to :role

  attr_accessible :action, :subject_class, :subject_id
end
