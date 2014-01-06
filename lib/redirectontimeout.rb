# encoding: utf-8

class Redirectontimeout < Devise::FailureApp
  def redirect
    message = warden.message || warden_options[:message]
    if message == :timeout
      redirect_to attempted_path
    else
      super
    end
  end
end

