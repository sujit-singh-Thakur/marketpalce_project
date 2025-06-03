class ContractorController < ApplicationController
  

  # def current_ability
  #   @current_ability ||= Ability.new(current_person)
  # end

  def home
    @all_contractor = User.where(type: 'Contractor').includes(:tasks => :category)
  end

  def show
    @contractor = User.find(params[:id])
  end

  def edit
  end

  def update
    if @contractor.update(contractor_params)
      redirect_to contractor_home_url, notice: "Contractor updated."
    else
      render :edit
    end
  end

  def destroy
    @contractor.destroy
    redirect_to contractor_url, notice: 'Contractor deleted.'
  end

  private

  def set_contractor
    @contractor = User.find(params[:id])
  end

  def contractor_params
    params.require(:user).permit(:name, :email, :phone)
  end
end
