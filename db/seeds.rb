# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Airport.delete_all
Flight.delete_all
FLIGHT_DURATIONS = [304, 503, 57, 129, 80, 75]

if Airport.none?
  Airport.create([{airport_code: "ATL", airport_name: "Hartsfield Jackson Atlanta International Airport"},
                  {airport_code: "PEK", airport_name: "Beijing Capital International Airport"},
                  {airport_code: "PKX", airport_name: "Beijing Daxing International Airport"},
                  {airport_code: "LHR", airport_name: "London Heathrow Airport"}, 
                  {airport_code: "HND", airport_name: "Tokyo International Airport"}, 
                  {airport_code: "ORD", airport_name: "O Hare International Airport"}, 
                  {airport_code: "LAX", airport_name: "Los Angeles International Airport"}, 
                  {airport_code: "CDG", airport_name: "Charles de Gaulle International Airport"}, 
                  {airport_code: "DFW", airport_name: "Dallas Fort Worth International Airport"}
                  #{airport_code: "CGK", airport_name: "Soekarno Hatta International Airport"}, 
                  #{airport_code: "DXB", airport_name: "Dubai International Airport"}, 
                  #{airport_code: "FRA", airport_name: "Frankfurt International Airport"}, 
                  #{airport_code: "HKG", airport_name: "Hong Kong International Airport"}, 
                  #{airport_code: "DEN", airport_name: "Denver International Airport"}, 
                  #{airport_code: "BKK", airport_name: "Suvarnabhumi Airport"}, 
                  #{airport_code: "SIN", airport_name: "Singapore Changi Airport"}, 
                  #{airport_code: "AMS", airport_name: "Amsterdam Airport Schiphol"}, 
                  #{airport_code: "JFK", airport_name: "John F Kennedy International Airport"}, 
                  #{airport_code: "CAN", airport_name: "Guangzhou Baiyun International Airport"}, 
                  #{airport_code: "MAD", airport_name: "Barajas International Airport"}
                  ])
end

if Flight.none?
  40.times { |i|
    11.times { |j|
      11.times { |k|
                  if j != k
                    if i%2==0
                      Flight.create({ departure_airport_id: j,
                        arrival_airport_id: k, 
                        start_date: Faker::Time.forward(days: 90),
                        #start_date: DateTime.now + i.days + (i-j+12).hours + k.minutes,
                        flight_duration: FLIGHT_DURATIONS[i % 6] 
                      })
                    end
                    Flight.create({ departure_airport_id: j,
                                    arrival_airport_id: k, 
                                    #start_date: Faker::Time.forward(days: 90),
                                    start_date: DateTime.now + i.days + (i-j+12).hours + k.minutes,
                                    flight_duration: FLIGHT_DURATIONS[i % 6] 
                                  })
                    Flight.create({ departure_airport_id: j,
                      arrival_airport_id: k, 
                      #start_date: Faker::Time.forward(days: 90),
                      start_date: DateTime.now + i.days + k.hours + (i-j+12).minutes,
                      flight_duration: FLIGHT_DURATIONS[i % 6] 
                    })
                  end
                }
              }
            }
end