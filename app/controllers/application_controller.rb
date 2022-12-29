class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # ユーザー名
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #プロフィール
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    #所属
    devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
    #役職
    devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
  end

end
