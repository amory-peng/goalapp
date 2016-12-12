class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :user_id)
  end
end
