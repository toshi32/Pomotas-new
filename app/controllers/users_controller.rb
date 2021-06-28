class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id]) #追記
  end
end
