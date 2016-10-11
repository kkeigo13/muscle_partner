class TweetsController < ApplicationController
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

  private
  def tweet_params
    params.permit(:work_date, :menu_name, :count, :remarks)
  end
end
