class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bookings = Booking.all
    @item = Item.first
    @booking = Booking.new
  end

end
