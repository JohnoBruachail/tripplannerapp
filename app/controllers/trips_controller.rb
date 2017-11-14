class TripsController < ApplicationController
  def index
    @itinerary = Itinerary.find(params[:itinerary_id])
    
    @trip = @itinerary.trips
  end

  def show
    @itinerary = Itinerary.find(params[:itinerary_id])
    
    @trip = @itinerary.trips.find(params[:id])
  end

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    
    @trip = @itinerary.trips.build
  end
  
  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    
    @trip = @itinerary.trips.build(params.require(:trip).permit(:confirmationnumber, :starttime, :startdate, :endtime, :enddate, :seatnumber, :carrier, :type)
    if @trip.save
    # Save the trip successfully
      redirect_to itinerary_trip_url(@itinerary, @trip)
    else
      render :action => "new"
    end

  def edit
  end
  
  
  
  
  
end