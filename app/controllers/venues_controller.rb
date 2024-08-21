class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /venues/new
  def new
    @venue = Venue.new
  end


  def show
    @venue = Venue.find(params[:id])

    # @marker = @venue.geocoded.map do |venue|
    #   {
    #     lat: venue.latitude,
    #     lng: venue.longitude
    #   }
    # end

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


  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to root_path, status: :see_other
  end

  def index
    @venues = Venue.all

  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :country, :description, :price)
  end
end
