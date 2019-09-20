class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    cocktail = Cocktail.find(params[:id])
    cocktail = Cocktail.update(strong_params)
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path(@cocktails)
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name)
  end

end
