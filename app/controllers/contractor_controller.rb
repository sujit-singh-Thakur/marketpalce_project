class ContractorController < ApplicationController
  def home
    @all_contractor  = Task.includes(:category)
  end
end
