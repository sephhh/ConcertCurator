class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order(:name)
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
