class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(description: dose_params, cocktail: @cocktail, ingredient: @ingredient)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save == true
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end