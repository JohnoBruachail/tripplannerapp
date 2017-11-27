class EmailProcessorController < ApplicationController
    
    #def initialize(email)
    def index
    @user = User.find(params[:user_id])
    
    end
    
    
    def initialize
        
        #Return email here to confirm receving the email
        
        @email = email
        @email.from = ""
        @email.body = "This is a confirmation of your flight. confirmation number: 37283. seat: 43B Take-off: 7:20a Landing: 8:00a travelocity Trip ID: 282648262 Flight: 342 San Jose (SJO) to Mexico City (MEX)"
        
=begin
        type                        Look for tag words like flight, train, ext.
        carrier                     Look for tag word for each carrier,can get carrier from that
        confirmationNumber          
        seatNumber                  Seat
        startTime                   Time Expression Departure: OR Take-off:
        endTime                     Second time Expression  Arrival: OR Landing:
        startDate                   First date expression   
        endDate =                   Second date expression
        startLocation =             Three large letters next to each other
        endLocation =               Three large letters next to each other
=end
        #this should be populated from a database
        airplane = ["plane", "airplane", "flight"]
        train = ["train", "rail" ]
        bus = [""]
        
        airlines = ["aer lingus", "asl airlines ireland", "cityjet", "norwegian air international", "ryanair", "stobard air"]
        railcarrier = ["dart", "northern commuter", "south eastern commuter", "south western commuter", "western commuter"]
        buscarrier = ["bus eireann", "matthews"]
        
        confirmationNo = ["confirmationNumber:", "Number"]
        
    end

    def process
        
        
        
        
        
        airplane.each do |word|
            if @email.body.include?(word)
                newTrip = PlaneTrip.new
            end
        train.each do |word|
            if @email.body.include?(word)
                newTrip = TrainTrip.new
            end  
        bus.each do |word|
            if @email.body.include?(word)
                newTrip = BusTrip.new
            end
 
        if newTrip.type == "plane"
            airlines.each do |word|
                if @email.body.include?(word)
                    newTrip.carrier = word
                end
            end
        elsif newTrip.type == "train"
            traincarrier.each do |word|
                if @email.body.include?(word)
                    newTrip.carrier = word
                end
            end
        elsif newTrip.type == "bus"
            buscarrier.each do |word|
                if @email.body.include?(word)
                    newTrip.carrier = word
                end
            end
        end
        
        confirmationNo.each do |word|
            if @email.body.match(/#{word}\/(\w*/)[1]
                #take the value after that word
                newTrip.confirmationNumber = word
            end
        end
    
=begin        
        newTrip.startTime = @email.body.match(/\d{1,2}\:\d{1,2}\/)
        
        #newTrip.endTime = @email.body.match(/\d{1,2}\:\d{1,2}\/)
        
        newTrip.startDate = @email.body.match(/\d{1,2}\/\d{1,2}\/\d{4}/)
        
        newTrip.endDate = @email.body.match(/\d{1,2}\/\d{1,2}\/\d{4}/)[1]
        
        newTrip.startLocation = @email.body.scan(/\b[A-Z]/)
        
        newTrip.endLocation = @email.body.scan(/\b[A-Z]/)[1]
=end

        newTrip.startTime = @email.body[/^([0-1][0-9]|[2][0-3]):([0-5][0-9])$/, 0]
        
        newTrip.endTime = @email.body[/^([0-1][0-9]|[2][0-3]):([0-5][0-9])$/, 1]
        
        newTrip.startDate = @email.body.[/\d{1,2}\/\d{1,2}\/\d{4}/, 0]
        
        newTrip.endDate = @email.body.[/\d{1,2}\/\d{1,2}\/\d{4}/, 1]
        
        newTrip.startLocation = @email.body[/\b[A-Z]/, 0]
        
        newTrip.endLocation = @email.body.[/\b[A-Z]/, 1]




        @user = User.find_by_email(@email.from[:email])
    
        @itinerary = @user.itineraries.find(params[:id])
        
        @trip = @itinerary.trips.build(params.require(:trip).permit(:confirmationnumber, :starttime, :startdate, :endtime, :enddate, :seatnumber, :carrier, :type)
        if @trip.save
        # Save the trip successfully
            redirect_to itinerary_trip_url(@itinerary, @trip)
        else
            render :action => "new"
        end
        
=begin
        user = User.find_by_email(@email.from[:email])
        user.posts.create!(subject: @email.subject, body: @email.body)
        
=end
        # all of your code to deal with the email goes here
        
    end
end