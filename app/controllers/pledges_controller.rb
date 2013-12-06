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

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to project_path(@project.id), notice: 'Pledge added.' }
        format.js {} 
      else
        format.html { render 'projects/show', alert: 'There was an error.'  }
        format.js {}
      end
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
