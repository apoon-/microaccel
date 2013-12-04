class PledgesController < ApplicationController
  before_filter :load_project

  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def show
    @pledge = Pledge.find(params[:id])
    remaining_date
  end

  def create
    @pledge = @project.pledges.build(pledge_params)
    @pledge.user_id = current_user.id

    if @pledge.save
      redirect_to project_path(@project), notice: "Discussion Successful"
    else
      render :new
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to projects_path
  end

  private 

  def pledge_params
    params.require(:pledge).permit(:project_id, :user_id, :amount_in_cents)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

end
