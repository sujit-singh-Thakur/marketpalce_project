class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end
  def search
    @tasks = Task.all 
    if params[:category].present?
      @tasks = @tasks.where(category_id: params[:category]) 
      @prioritized_tasks = @tasks.where(category_id: params[:category])
      @other_tasks = @tasks.where.not(category_id: params[:category])
      @tasks = @prioritized_tasks.to_a + @other_tasks.to_a
      redirect_to search_category_url
    end
  end

  def new
    @task = Task.new
  end

  # def create
  #  @task = Task.new(param_task={
  #     description: params[:description],
  #     contact_info: params[:contact_info],
  #     category_id: params[:category_id],
  #     contractor_id: params[:contractor_id]
  #     })
  #  # debugger
  #  if @task.save
  #   redirect_to contractor_home_url
  #  else
  #   render :new
  #  end
  # end

  def edit
    @task = Task.find(params[:id])
  end

  def create
  @task = Task.new(
    description: params[:task][:description],
    contact_info: params[:task][:contact_info],
    category_id: params[:task][:category_id],
    contractor_id: current_user.id # ← assign contractor here
  )

  if @task.save
    redirect_to contractor_home_url, notice: "Task created successfully."
  else
    render :new
  end
end



  private
  def param_task
      params.require(:task).permit(:description, :contact_info, :category_id)
  end
end
