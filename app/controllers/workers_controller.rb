class WorkersController < ApplicationController
  before_action :set_task, only: %i[apply create_application]
  before_action :set_page, only: [ :edit, :update ]

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
    @applied_task_ids = current_user.applications.pluck(:task_id)
  end

  def apply
    @application = Application.new
  end
 
  def create_application
    @application = Application.new(application_params)
    @application.worker_id = current_user.id
    @application.task_id = @task.id
    @application.email = current_user.email
    if @application.save
      TaskMailer.worker_applied_email(@application).deliver_now

      redirect_to home_workers_url, notice: "Application submitted!"
    else
      render :apply, alert: "Something went wrong."
    end
  end 

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to home_workers_url, notice: "worker updated."
    else
      render :edit
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def set_page
    @worker = Worker.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:status, :email, :contact_number, :address, :resume)
  end

  def worker_params
    params.require(:worker).permit(:name, :email, :contact, :type)
  end
end
