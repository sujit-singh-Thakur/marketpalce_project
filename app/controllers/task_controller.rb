class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end
  def search
    @tasks = Task.all # Fetch all tasks
    if params[:category].present?
      @tasks = @tasks.where(category_id: params[:category]) # Filter by category
      # Prioritize tasks from the matching category
      @prioritized_tasks = @tasks.where(category_id: params[:category])
      @other_tasks = @tasks.where.not(category_id: params[:category])
      @tasks = @prioritized_tasks.to_a + @other_tasks.to_a
      redirect_to search_category_url
    end
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
    params.expect(task: [ :description, :contact_info, :category_id, :contractor_id ])
  end
end
