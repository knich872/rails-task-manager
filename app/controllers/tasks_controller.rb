class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]

  def checkbox(task)
    if task.completed == true
      checkbox = '<i class="fa-regular fa-square-check"></i>'
    else
      checkbox = '<i class="fa-regular fa-square"></i>'
    end
    checkbox
  end

  def index
    @tasks = Task.all
    @checkbox = @tasks.each do |task|
      checkbox(task)
    end
  end

  def show
    @task = Task.find(params[:id])
    # @checkbox = checkbox(task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path()
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path()
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
