class Trip
    def type
        raise NotImplementedError, 'Ask type'
    end
    def carrier
        raise NotImplementedError, 'Ask carrier'
    end
    def confirmationNumber
        raise NotImplementedError, 'Missing confirmationNumber'
    end
    def seatNumber
        raise NotImplementedError, 'Ask type'
    end
    def startTime
        raise NotImplementedError, 'Ask type'
    end
    def endTime
        raise NotImplementedError, 'Ask type'
    end
    def startDate
        raise NotImplementedError, 'Ask type'
    end
    def endDate
        raise NotImplementedError, 'Ask type'
    end
    def startLocation
        raise NotImplementedError, 'Ask type'
    end
    def endLocation
        raise NotImplementedError, 'Ask type'
    end
end

class PlaneTrip < Trip
    def type
        'Plane'
    end
end

class TrainTrip < Trip
    def type
        'Train'
    end
end

class BusTrip < Trip
    def type
        'Bus'
    end
end
    
    
    
    