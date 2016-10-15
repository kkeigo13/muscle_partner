class TweetsController < ApplicationController
  before_action :move_to_sign_in

  def index
    @tweet = Tweet.all
  end

  def new
  end

  def create
    Tweet.create(work_date: tweet_params[:work_date], menu_name: tweet_params[:menu_name], count: tweet_params[:count], remarks: tweet_params[:remarks], user_id: current_user.id)
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
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
    params.permit(:work_date, :menu_name, :count, :remarks)
  end

  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
