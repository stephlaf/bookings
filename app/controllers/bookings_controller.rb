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

  def my_bookings
    @my_bookings = current_user.owner_bookings
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status].to_i.zero? ? false : true
    if @booking.save
      redirect_to my_bookings_path
    else
      render :my_bookings
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
