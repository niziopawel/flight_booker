class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.city, airport.id] }

    return unless params[:search]

    params[:search].delete_if { |_k, v| v.empty? }
    @filtered_flights = Flight.search(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end
