class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @bookings = @item.bookings
  end
end
