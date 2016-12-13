class GoalCommentsController < ApplicationController
  def new
    @goal_comment = GoalComment.new
  end

  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.author_id = current_user.id
    if @goal_comment.save
      redirect_to goal_url(@goal_comment.goal)
    else
      flash[:errors] = @goal_comment.errors.full_messages
      redirect_to goal_url(@goal_comment.goal)
    end
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])
    @goal_comment.destroy
    redirect_to goal_url(@goal_comment.goal)
  end

  private

  def goal_comment_params
    params.require(:goal_comment).permit(:description, :author_id, :goal_id)
  end
end
