class Room

    attr_reader :theme, :capacity, :songbook
    
    def initialize(theme, capacity)
        @theme = theme
        @capacity = capacity
        @songbook = Hash.new(0)
    end

    def song_book(songs)
        return @songbook[songs]
    end

end