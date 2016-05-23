class TopicsController < ApplicationController

  # #7
    before_action :require_sign_in, except: [:index, :show]
  # #8
    before_action :authorize_user, except: [:index, :show]


  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end


  def create
    @topic = Topic.new(topic_params)
    comment = @topic.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
# #12
      redirect_to [@topic.topic, @topic]
    else
      flash[:alert] = "Comment failed to save."
# #13
      redirect_to [@topic.topic, @topic]
    end

   if @topic.save
      @topic.labels = Label.update_labels(params[:topic][:labels])
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end


  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)

    if @topic.save
       @topic.labels = Label.update_labels(params[:topic][:labels])
       flash[:notice] = "Topic was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
  @topic = Topic.find(params[:id])
  comment = @topic.comments.find(params[:id])

  if comment.destroy
    flash[:notice] = "Comment was deleted successfully."
    redirect_to [@post.topic, @post]
  else
    flash[:alert] = "Comment couldn't be deleted. Try again."
    redirect_to [@post.topic, @post]
  end

  if @topic.destroy
    flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
    redirect_to action: :index
  else
    flash.now[:alert] = "There was an error deleting the topic."
    render :show
  end
end

 private

 def comment_params
   params.require(:comment).permit(:body)
 end

 def topic_params
  params.require(:topic).permit(:name, :description, :public)
 end

# #9
  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
