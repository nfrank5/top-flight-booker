class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  def self.search(search_params)
    Flight.where(departure_airport_id: search_params[:departure_airport_id],
                             arrival_airport_id: search_params[:arrival_airport_id])
    .select do |f|
      "#{f.start_date.year}/#{f.start_date.month}/#{f.start_date.day}" == search_params[:flight_date]
    end
  end

  def flight_details
    "Departure Airport: #{departure_airport.airport_code} - Arrival Airport: #{arrival_airport.airport_code} - Date: #{start_date.strftime("%d %B %Y - Departure Time: %H:%M")}"
  end
end
