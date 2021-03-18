class CocktailsController < ApplicationController

  def index
    @cocktails = policy_scope(Cocktail).order(created_at: :desc)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    authorize @cocktail
    if @cocktail.save == true
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  def destroy
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url, :description, :photo)
  end
end
