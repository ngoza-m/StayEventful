class VenuesController < ApplicationController
  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    # if save is successful, user is redirected venue’s show page with a success message.
    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created!'
    # if save fails (due to validation errors), form is re-rendered, and user remains on new page,
    # with an appropriate status code (422 Unprocessable Entity).
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :country, :description, :price)
  end
end
