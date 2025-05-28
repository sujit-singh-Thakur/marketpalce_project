class WorkerController < ApplicationController
  def home
    @all_task = Task.all
    #  @all_task = Category.all

  end

end
