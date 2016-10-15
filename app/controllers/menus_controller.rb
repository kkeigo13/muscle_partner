class MenusController < ApplicationController

  before_action :move_to_sign_in

  def index
    @menus = Menu.all
    @menu = Menu.new
  end



  def create
    Menu.create(menu: menu_params[:menu], user_visible: 2, user_id: current_user.id)
    @menus = Menu.all
  end

  def destroy
    menu = Menu.find(params[:id])
    if menu.user_id == current_user.id
      menu.destroy
    end
    @menus = Menu.all
  end



  private

  def menu_params
    params.permit(:menu)
  end
  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
