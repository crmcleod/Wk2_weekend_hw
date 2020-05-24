class Room

    attr_reader :theme, :capacity, :guests_in_room, :time_limit, :song_book
    attr_accessor :song_queue
    
    def initialize(theme, capacity, guests_in_room = [], song_queue = [], song_book)
        @theme = theme
        @capacity = capacity
        @guests_in_room = guests_in_room
        @song_queue = song_queue
        @time_limit = Time.new()+1
        @song_book = song_book
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

    def add_song(song)
        @song_queue << song
    end

    def add_all_songs(song_book, song_queue)
        song_book.each { |song| song_queue << song}
    end

    def time_up()
        while Time.new != @time_limit
        end
        p "Time is up, everybody out!"
            # use enumerator to move guests back to lobby/bar
            @guests_in_room.clear()
    end

end