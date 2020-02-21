class CocktailsController < ApplicationController
  def index
    if params[:search] && params[:search][:query] != ''
      @cocktails = Cocktail.all.select { |cocktail| cocktail.name.downcase.include(params[:search][:query].downcase) }
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    find
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
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
    if @cocktail.update(cocktail_params)
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

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
