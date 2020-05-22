class Room

    attr_reader :room_theme, :capacity, :songbook
    
    def initialize(room_theme, capacity)
        @room_theme = room_theme
        @capacity = capacity
        @songbook = Hash.new(0)
    end
end