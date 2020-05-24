class Room

    attr_reader :theme, :capacity, :guests_in_room, :time_limit, :song_book, :cost
    attr_accessor :song_queue
    
    def initialize(theme, capacity, guests_in_room = [], song_queue = [], song_book)
        @theme = theme
        @capacity = capacity
        @guests_in_room = guests_in_room
        @song_queue = song_queue
        @time_limit = Time.new()+3
        @song_book = song_book
        @cost = 10
    end

    def check_in(guest, room)

        if can_guest_afford_room(guest, room) != true
            p "Sorry #{guest.name}, but you don't have enough money!"
        end
        if
            can_guest_afford_room(guest, room) == true &&
            number_of_guests < capacity
            @guests_in_room << guest
        elsif number_of_guests == capacity
            p "Sorry #{guest.name}, but there's no space for you in the #{room.theme} room."
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

    def can_guest_afford_room(guest, room)
        if guest.wallet >= room.cost
            return true
        else
            return false
        end
    end

end