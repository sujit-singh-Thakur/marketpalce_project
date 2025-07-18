class ContractorsController < ApplicationController
  before_action :set_contractor, only: [ :show, :edit, :update, :destroy ]

  def applications
    @applications = Application.includes(:task, :worker).where(tasks: { contractor_id: current_user.id })
  end

  def home
    if current_user.type == "Contractor"
     @tasks = current_user.tasks.includes(:category)
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def show
    @contractor = User.find(params[:id])
  end

  def edit
  end

  def update
    if @contractor.update(contractor_params)
      redirect_to home_contractors_url, notice: "Contractor updated."
     else
      render :edit
    end
  end

  def update_status
    @application = Application.find(params[:id])
    if @application.update(status: params[:status])
      TaskMailer.status_updated_email(@application).deliver_now
      message =
      if params[:status] == "accepted"
        "Congratulations Your application for the task '#{@application.task.description}' has been accepted."
        else
        "Sorry Your application for the task '#{@application.task.description}' has been rejected."
      end
      SmsSender.send_sms(to: @application.worker.contact, body: message)
      redirect_to applications_contractors_path, notice: "Application #{params[:status].capitalize}!"
    else
      redirect_to applications_contractors_path, alert: "Failed to update application."
    end
  end

  def destroy
    @contractor.destroy
    redirect_to home_contractors_url, notice: "Contractor deleted."
  end

  private
  def set_contractor
    @contractor = User.find(params[:id])
  end

  def contractor_params
    params.require(:contractor).permit(:name, :email, :contact, :type)
  end
end
