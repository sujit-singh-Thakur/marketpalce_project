class Admin::TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.includes(:contractor, :category)
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to admin_tasks_path, notice: "Task updated."
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path, notice: "Task deleted."
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :contact_info, :category_id, :contractor_id)
  end
end
