class WorkerController < ApplicationController
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
     @application.worker_id = current_user.id  # Ensure Devise or session-based login is present
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
