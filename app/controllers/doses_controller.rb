class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.all
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient)
    end
end
