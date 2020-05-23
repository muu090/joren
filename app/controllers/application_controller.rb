class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #sign_in後のredirect先をマイページ(ユーザ詳細ページ)へ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  #sign_out後のredirect先をroot(topページ)へ
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
