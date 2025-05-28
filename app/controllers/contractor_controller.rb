class ContractorController < ApplicationController
  def home
    @all_contractor  = Task.all
  end
end
