class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @bookings = @item.bookings
  end
end
