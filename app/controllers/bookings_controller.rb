class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.renter = current_user
    # @booking.owner = @item.user
    @booking.save!
    redirect_to item_path(@booking.item)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
