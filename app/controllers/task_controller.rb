class TaskController < ApplicationController
  def index
  end
  def new
    @task = Task.new
  end

  def create
    # name = params[:name]
    # contractor = Contractor.find_by(name: name)
    # contractor = Contractor.find_by(contractor_id: contractor_name)
   @task = Task.new(param_task={
      description: params[:description],
      contact_info: params[:contact_info],
      category_id: params[:category_id],
      contractor_id: params[:contractor_id]
      })
    # debugger
   if @task.save
    redirect_to contractor_home_url
   else
    render :new
   end
  end

  def edit 
    @task = Task.find(params[:id])
  end



  private
  def param_task
    params.expect(task: [:description,:contact_info,:category_id,:contractor_id])
  end

end



