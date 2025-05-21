class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :location, :description, :price, :number_guests, :user_id)
  end
end
