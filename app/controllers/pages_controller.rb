class PagesController < ApplicationController
  def home
    @user = User.last
    @venues = Venue.all
  end
end
