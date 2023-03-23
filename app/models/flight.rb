class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.searchxxx(search_params)
    dep_arr = Flight.all.where("departure_airport_id = ? AND arrival_airport_id = ? " ,
      search_params[:departure_airport_id],
      search_params[:arrival_airport_id],
    )
    dep_arr.select do |f|
      "#{f.start_date.year}/#{f.start_date.month}/#{f.start_date.day}" == search_params[:flight_date]
    end
  end

  def self.search(search_params)
    Flight.where(departure_airport_id: search_params[:departure_airport_id],
                             arrival_airport_id: search_params[:arrival_airport_id])
    .select do |f|
      "#{f.start_date.year}/#{f.start_date.month}/#{f.start_date.day}" == search_params[:flight_date]
    end
  end
end
