class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    find
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(user_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    find
  end

  def update
    find
    if @cocktail.update(user_params)
      redirect_to cocktail_path(@cocktail)
    else
      redner :edit
    end
  end

  def destroy
    find
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find
    @cocktail = Cocktail.find(params[:id])
  end

  def user_params
    params.require(:cocktail).permit(:name)
  end
end
