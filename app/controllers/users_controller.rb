class UsersController < ApplicationController

  before_action :move_to_sign_in

  def index
    @user = User.all
    @chart_data = Tweet.where(user_id: current_user.id).order('work_date ASC')
    @menu_chart_d =[]
    @menu_name_d = []
    @user_menu_d = Menu.where(user_visible:1)
    @user_menu_d.each do |m|

        @chart_d = []
        @chart_data.each do |data|
          if m.menu == data.menu_name
          @menu_name_d << data.menu_name
          @one_day_d = [data.work_date.to_s, data.menu_count]
          @chart_d << @one_day_d
          end

        end
      @menu_chart_d << @chart_d

    end

    @menu_chart =[]
    @user_menu = Menu.where(user_id: current_user.id)
    @user_menu.each do |m|

        @chart = []
        @chart_data.each do |data|
          if m.menu == data.menu_name
          @menu_name = data.menu_name
          @one_day = [data.work_date.to_s, data.menu_count]
          @chart << @one_day
          end

        end
      @menu_chart << @chart

    end

  end



  private
  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
