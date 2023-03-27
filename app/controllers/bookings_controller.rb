class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passangers_qty].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

  end

  def show
  end

  private


  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email, :id])
  end

end
