class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passangers_qty].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email, :id, :_destroy])
  end

end
