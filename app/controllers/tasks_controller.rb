class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy, :index]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "新規タスクを作成しました。"
      else
      render :new
      end
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクの編集を行いました。"
    else
      render :edit
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: @task.user_id)
    @comments = @task.comments
    @comment = @task.comments.build
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました。"
  end

  def toggle_status
    @task.toggle_status!
    redirect_to tasks_path, notice: 'ステータスを更新しました。'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :time_limit, :user_id, { label_ids: [] }, :status )
  end

  def set_task
    #@task = Task.find(params[:id])
    @task = Task.find(params[:id] || params[:task_id])
  end

end
