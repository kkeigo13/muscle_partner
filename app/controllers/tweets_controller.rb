class TweetsController < ApplicationController
  before_action :move_to_sign_in

  def index
    @tweet = Tweet.where(user_id: current_user.id).order("work_date DESC").page(params[:page]).per(10)
  end

  def new
    @tweet = Tweet.new
    @menu1 = Menu.where(user_id: current_user.id)
    @menu2 = Menu.where(user_id: 1)
    @menu = @menu1 + @menu2

  end

  def create
    Tweet.create(tweet_params)
    redirect_to :action => "index"
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to :action => "index"
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @menu1 = Menu.where(user_id: current_user.id)
    @menu2 = Menu.where(user_id: 1)
    @menu = @menu1 + @menu2
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    redirect_to :action => "index"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:work_date, :menu_name, :menu_count, :remarks).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
