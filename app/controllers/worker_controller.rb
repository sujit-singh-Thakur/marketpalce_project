class WorkerController < ApplicationController
  def home
    @all_task = Task.includes(:category)
  end
end
