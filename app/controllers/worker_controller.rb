class WorkerController < ApplicationController


  before_action :set_task, only: %i[apply create_application]

def my_applications
  @applications = Application.includes(:task).where(worker_id: current_user.id)
end

  def home
    if params[:category_id].present?
    @all_task = Task.includes(:category, :contractor).where(category_id: params[:category_id])
  else
    @all_task = Task.includes(:category, :contractor)
  end

  @categories = Category.all
  end

  def apply
    @application = Application.new
  end

  def create_application
    @application = Application.new(application_params)
    @application.worker_id = current_user.id

    @application.task_id = @task.id

    if @application.save
      TaskMailer.worker_applied_email(@application).deliver_now
 
      redirect_to "http://localhost:3000/letter_opener", allow_other_host: true, notice: "Application submitted!"

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
