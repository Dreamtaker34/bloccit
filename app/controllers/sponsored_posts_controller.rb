class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end

  def new
    @sponsoredpost = Sponsoredpost.new
  end

  def create
    @sponsoredpost = Sponsoredpost.new
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]

    if @sponsoredpost.save
      flash[:notice] = "Post was saved."
      redirect_to @sponsoredpost
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
