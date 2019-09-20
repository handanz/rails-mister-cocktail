class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    # raise
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # @cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.new(strong_params_dose)
    dose.cocktail = @cocktail
    if dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def strong_params_dose
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
