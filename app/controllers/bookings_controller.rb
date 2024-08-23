class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def create
        @venue = Venue.find(params[:venue_id])
        @booking = Booking.new(bookings_params)
        @booking.venue = @venue
        @booking.user = current_user
         
        if @booking.save
            redirect_to profile_path
        else
            render "venues/show", status: :unprocessable_entity
        end
        
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to profile_path(current_user)

    end

    private

    def bookings_params
        params.require(:booking).permit(:venue_id, :date, :hours, :total)
    end
end
