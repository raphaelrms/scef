class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    binding.pry
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end

  def home
    @users = User.all
  end

end
