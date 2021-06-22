class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @blog.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_path(@task) }
      else
        format.html { redirect_to task_path(@task), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:task_id, :content)
  end
end
