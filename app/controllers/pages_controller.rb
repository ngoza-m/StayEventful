class PagesController < ApplicationController
  def home
    @venues = Venue.all
  end
end
