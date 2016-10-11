class UsersController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @user = User.find(1)
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
