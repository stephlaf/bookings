class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    @booking.save!
    redirect_to root_path
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :item_id)
  end
end
