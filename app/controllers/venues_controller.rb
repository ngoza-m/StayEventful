class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show edit]

  # GET /venues
  def index
    @venues = Venue.all
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/:id
  def show
    @venue = Venue.find(params[:id])
    @marker = [{ lat: @venue.latitude, lng: @venue.longitude }]
    
    @booking = Booking.new
    @bookings = Booking.where(venue_id: @venue.id)

  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    # if save is successful, user is redirected venue’s show page with a success message.
    if @venue.latitude.nil? || @venue.longitude.nil?
      render :new, status: :unprocessable_entity, notice: 'Address was not found, please try again'
    elsif @venue.save
      redirect_to @venue, notice: 'Venue was successfully created!'
    # if save fails (due to validation errors), form is re-rendered, and user remains on new page,
    # with an appropriate status code (422 Unprocessable Entity).
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  # DELETE /venues/:id
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to profile_path, status: :see_other
  end


  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :price, :photo)
  end
end
