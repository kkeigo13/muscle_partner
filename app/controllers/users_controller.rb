class UsersController < ApplicationController

  before_action :move_to_sign_in

  def index
    @user = User.all
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.user_id == current_user.id
      user.update(params)
    end
    redirect_to :action => "index"
  end

  private
  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
