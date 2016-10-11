class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
  end

  def create
    Menu.create(menu: menu_params[:menu], user_visible: 2, user_id: current_user.id)
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
end
