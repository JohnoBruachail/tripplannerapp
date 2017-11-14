class ItineraryController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    
    @itinerary = @user.itineraries
  end

  def show
    @user = Users.find(params[:user_id])
    
    @itinerary = @user.itineraries.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    
    @itinerary = @user.itinerary.build
  end
  
  def create
    @user = User.find(params[:user_id])
    
    @itinerary = @user.itinerary.build(params.require(:itinerary).permit(:details))
    if @review.save
    # Save the review successfully
    redirect_to movie_review_url(@movie, @review)
    else
    render :action => "new"
    end

  def edit
  end
end
end
