class WorkerController < ApplicationController
  # before_action :authenticate_person!

  before_action :set_task, only: %i[apply create_application]

  def home
    # @all_task = Task.includes(:category, :contractor)
    if params[:category_id].present?
    @all_task = Task.includes(:category, :contractor).where(category_id: params[:category_id])
  else
    @all_task = Task.includes(:category, :contractor)
  end

  @categories = Category.all
  end

  def apply
    @application = Application.includes(:worker)
  end

  def create_application
    @application = Application.new(application_params)
     @application.workers_id = current_person.id  
    @application.task_id = @task.id

    if @application.save
      redirect_to worker_home_path, notice: "Application submitted!"
    else
      render :apply, alert: "Something went wrong."
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:status, :email,:contact_number, :address)
  end
end
