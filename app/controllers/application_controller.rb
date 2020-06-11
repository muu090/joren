class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def barrier_user(user)
    unless user == current_user or current_user.following?(user)
      redirect_to user_path(current_user)
    end
  end

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
