class GoalsController < ApplicationController
  before_action :ensure_user
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    if @goal.status == "private" && current_user.id != @goal.user_id
      flash[:errors] = "not your goal buddy"
      redirect_to goals_url
    else
      render :show
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.user_id = current_user.id
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :user_id, :status, :completed)
  end
end
