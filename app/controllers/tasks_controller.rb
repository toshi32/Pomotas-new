class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    #@tasks = current_user.tasks.all
    @tasks = @q.result
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
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :time_limit, :user_id, { label_ids: [] } )
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
