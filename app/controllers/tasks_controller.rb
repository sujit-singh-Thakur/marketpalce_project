class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    if @task.update(param_task)
      redirect_to home_contractors_url, notice: "Task updated successfully."
     else
      render :edit
    end
  end

  def create
    @task = Task.new(
      description: params[:task][:description],
      contact_info: current_user.contact,
      category_id: params[:task][:category_id],
      contractor_id: current_user.id
    )
    if @task.save
      redirect_to home_contractors_url, notice: "Task created successfully."
     else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to home_contractors_url, notice: "Task deleted successfully."
  end


  private
  def set_task
    @task = Task.find(params[:id])
  end

  def param_task
      params.require(:task).permit(:description, :contact_info, :category_id, :contractor_id)
  end
end
