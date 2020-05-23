class Room

    attr_reader :theme, :capacity, :guests_in_room, :songbook
    
    def initialize(theme, capacity, guests_in_room = [], songbook = [])
        @theme = theme
        @capacity = capacity
        @guests_in_room = guests_in_room
        @songbook = songbook
    end

    def check_in(guest)
        @guests_in_room << guest
    end

    def number_of_guests()
       return @guests_in_room.count()
    end
end