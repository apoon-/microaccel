class DiscussionsController < ApplicationController
def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def show
    @discussion = Discussion.find(params[:id])
    remaining_date

  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def create
    @discussion = Discussion.new(discussion_params)

    if @discussion.save
      redirect_to discussions_url
    else
      render :new
    end
  end

  def update
    @discussion = Discussion.find(params[:id])

    if @discussion.update_attributes(discussion_params)
      redirect_to discussion_path(@discussion)
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to projects_url
  end

  private 

  def discussion_params
    params.require(:discussion).permit(:project_id, :user_id, :comment)
  end
end
