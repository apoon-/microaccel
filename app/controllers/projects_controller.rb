class ProjectsController < ApplicationController
  def index
    @subtotal = 0
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    remaining_date
    pledges_so_far

    if current_user
      @pledge = @project.pledges.build
      @discussion = @project.discussions.build
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  def remaining_date
    @days_left = (@project.end_date - @project.start_date).to_i
  end

  def pledges_so_far
    # @total = 0

    # @totalpledges = Project.find(params[:id]).pledges
    # @totalpledges.each do |t|
    #   @total += t.amount_in_cents
    # end

    @total = @project.pledges.sum(:amount_in_cents) 

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :goal_in_cents, :photo, :start_date, :end_date, :tag_list)
  end

end
