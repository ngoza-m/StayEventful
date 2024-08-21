class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  @venue = Venue.find(params[:id])
  @venue.destroy
  redirect_to root_path, status: :see_other
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :country, :description, :price)
  end
end
