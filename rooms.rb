class Room

    attr_reader :theme, :capacity, :guests_in_room, :songbook
    
    def initialize(theme, capacity, guests_in_room = [], songbook = [])
        @theme = theme
        @capacity = capacity
        @guests_in_room = guests_in_room
        @songbook = songbook
    end

    def check_in(guest)
        if number_of_guests < capacity
        @guests_in_room << guest
        else
            p "Sorry the room is full, try another"
        end
    end

    def check_out(guest)
        @guests_in_room.delete(guest)
    end

    def number_of_guests()
       return @guests_in_room.count()
    end
end