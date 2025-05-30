class ContractorController < ApplicationController
  def home
    @all_contractor  = Task.includes(:category)
  end
  def show
  @contractor = User.find(params[:id])
end

def destroy
  @contractor = User.find(params[:id])
  @contractor.destroy
  redirect_to contractor_home_url, notice: 'User deleted'
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
  @task = Task.find(params[:id])
  @task.delete
  redirect_to admin_tasks_path, notice: "Task deleted."
end

end

