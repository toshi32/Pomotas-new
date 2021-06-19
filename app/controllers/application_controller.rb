class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!  # ログイン済ユーザーのみにアクセスを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?# deviseコントローラーにストロングパラメータを追加する

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])# サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])# アカウント編集の時にnameのストロングパラメータを追加
  end

end