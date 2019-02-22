class DosesController < ApplicationController
  before_action :set_cocktail, only: [:show, :new, :create]
  def index
    @cocktail = Cocktail.all
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_url, notice: 'Dose was successfully destroyed.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
