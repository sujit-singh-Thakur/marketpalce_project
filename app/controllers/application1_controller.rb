class Application1Controller < ApplicationController
  def index
  end
  def new
    @application = Application.new
  end

def create
  @task = Task.find(params[:task_id])
  @application = @task.applications.new(application_params)

  if @application.save
    
    TaskMailer.worker_applied_email(@application).deliver_now
    redirect_to worker_home_path, notice: "Application submitted and email sent."
  else
    render :new
  end
end

def select_worker
  @task = Task.find(params[:id])
  @worker = Worker.find(params[:worker_id])
  @task.update(selected_worker: @worker) 

  TaskMailer.worker_selected_email(@worker, @task).deliver_now

  redirect_to contractor_home_path, notice: "Worker selected and notified."
end

    private
    def param_application
      params.expect(application: [:task_id,:workers_id,:status,:email,:contact_number,:address])
    end
end
