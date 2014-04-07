class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def home
    #@users = User.all
    @noticias = Noticia.paginate(:page => params[:page])
  end

end
