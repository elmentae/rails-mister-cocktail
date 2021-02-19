class CocktailsController < ApplicationController
  before_action :default_image

  def index
    @cocktail = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save == true
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def default_image
    @def_img = "https://i.ytimg.com/vi/zAVGfPSnGaw/maxresdefault.jpg"
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url, :description, :photo)
  end
end
