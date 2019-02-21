class CocktailsController < ApplicationController
   before_action :set_cocktail, only: [:show]

  # GET /cocktails
  # GET /cocktails.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
     redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end
