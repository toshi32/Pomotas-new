class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to tasks_path, notice: '無効な操作が行われました'
    end
  end
end
