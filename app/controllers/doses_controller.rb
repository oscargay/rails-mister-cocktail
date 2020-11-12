class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
