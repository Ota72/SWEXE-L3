class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    file = params[:tweet][:file].read
    @tweet = Tweet.new(message: params[:tweet][:message], file: file, tdate: Time.current)
    if @tweet.save
      flash[:notice] = '追加しました'
      redirect_to '/' 
    else
      render 'new'
    end
  end

  def edit
    @tweet =Tweet.find(params[:id])
  end

  def update
    @tweet =Tweet.find(params[:id])
    file = params[:tweet][:file].read
    if @tweet.update(message: params[:tweet][:message], file: file)
      flash[:notice] = '更新しました'
      redirect_to '/'
    else
      render 'edit'
    end
  end
    
  def show
    @tweet =Tweet.find(params[:id])
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = '削除しました'
    redirect_to '/'
  end
  
  def get_image
    @tweet = Tweet.find(params[:id]) 
    send_data @tweet.file, disposition: :inline, type: 'image/jpg' 
  end
end
