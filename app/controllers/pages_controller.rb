class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    # @venues = Venue.all
    @venues = Venue.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
    # @other_bookings = Booking.where()
  end

  def home
    @venues = Venue.all.limit(8)
  end
end
