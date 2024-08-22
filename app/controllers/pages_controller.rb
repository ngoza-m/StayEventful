class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    # @venues = Venue.where( venue.user_id = current_user.id )
  end

  def home
    @venues = Venue.all.limit(8)
  end
end
