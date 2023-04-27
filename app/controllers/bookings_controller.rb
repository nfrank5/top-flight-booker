class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:passangers_qty].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    p Flight.find(booking_params[:flight_id])
    @flight = Flight.find(booking_params[:flight_id])
    @booking.passengers.each do |pax|
      PassengerMailer.with(flight: @flight).confirmation_email(pax).deliver_now
    end
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
