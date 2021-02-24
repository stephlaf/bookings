class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    @booking.save!
    redirect_to item_path(@booking.item)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
