class FlightsController < ApplicationController
  before_action :set_search_options, only: [:index]

  def index
    return if search_params.empty?

    @filtered_flights = Flight.search(search_params)
  end

  private

  def set_search_options
    @search = params[:search]
    @airport_options = Airport.all.map { |airport| [airport.city, airport.id] }
    @default_date = Time.now.strftime('%d-%m-%Y')
  end

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end
