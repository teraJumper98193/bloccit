class SponsoredPostsController < ApplicationController

  def show
    @SponsoredPost = SponsoredPost.find(params[:id])
  end

  def new
    @SponsoredPost = SponsoredPost.new
  end

  def edit
    @SponsoredPost = SponsoredPost.find(params[:id])
  end

  def create
    @SponsoredPost = SponsoredPost.new
    @SponsoredPost.name = params[:SponsoredPost][:name]
    @SponsoredPost.description = params[:SponsoredPost][:description]
    @SponsoredPost.public = params[:SponsoredPost][:public]

    if @SponsoredPost.save
      flash[:notice] = "SponsoredPost was saved successfully."
      redirect_to @SponsoredPost
    else
      flash.now[:alert] = "Error creating SponsoredPost. Please try again."
      render :new
    end
  end

  def update
    @SponsoredPost = SponsoredPost.find(params[:id])

    @SponsoredPost.name = params[:SponsoredPost][:name]
    @SponsoredPost.description = params[:SponsoredPost][:description]
    @SponsoredPost.public = params[:SponsoredPost][:public]

    if @SponsoredPost.save
       flash[:notice] = "SponsoredPost was updated successfully."
      redirect_to @SponsoredPost
    else
      flash.now[:alert] = "Error saving SponsoredPost. Please try again."
      render :edit
    end
  end

  def destroy
  @SponsoredPost = SponsoredPost.find(params[:id])

  if @SponsoredPost.destroy
    flash[:notice] = "\"#{@SponsoredPost.name}\" was deleted successfully."
    redirect_to action: :index
  else
    flash.now[:alert] = "There was an error deleting the SponsoredPost."
    render :show
   end
 end

end
