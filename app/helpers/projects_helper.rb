module ProjectsHelper
  def percentagechecker(project)
    @percent = (project.pledges.sum(:amount_in_cents).to_f/project.goal_in_cents.to_f) *100
    if @percent > 100
      @percent = 100
    else
      @percent
    end
  end
end
