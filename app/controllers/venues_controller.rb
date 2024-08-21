class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :country, :description, :price)
  end
end
