json.extract! trip, :id, :confirmationnumber, :starttime, :startdate, :endtime, :enddate, :seatnumber, :carrier, :type, :created_at, :updated_at
json.url trip_url(trip, format: :json)
