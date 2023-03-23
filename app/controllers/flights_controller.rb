class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map{ |a| [ "#{a.airport_code} - #{a.airport_name[0..10]}", a.id ] }
    @flight_dates = (Flight.distinct.pluck(:start_date).map{ |d| [d.strftime("%Y/%-m/%d")] }).uniq.sort
    @flights_available = Flight.search(search_params)
  end


  private
  
  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :flight_date, :passangers_qty, :commit, :controller, :action)
  end
end
