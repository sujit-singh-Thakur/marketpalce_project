class Application1Controller < ApplicationController
  def index
  end
  def new
    @application = Application.new
  end
  # name: params[:name],
  def create 
    @application = Application.new(param_application={
      task_id: params[:task_id],
      workers_id: params[:workers_id],
      status: params[:status],
      email: params[:email],
      contact_number: params[:contact_number],
      address:  params[:address]  })
      
      if @application.save
        redirect_to worker_home_url
      else
        render :new
      end
    end 

    private
    def param_application
      params.expect(application: [:task_id,:workers_id,:status,:email,:contact_number,:address])
    end
end
