require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class RoomTest < MiniTest::Test

    def setup
        @room1 = Room.new("Under the sea", 5, @song_book)
        @room2 = Room.new("Cloud 9", 10, @song_book)
        @room3 = Room.new("Valhalla", 8, @song_book)
        @room4 = Room.new("Lone Wolf", 1, @song_book)
        @room5 = Room.new("Woodland", 20, @song_book)

        @guest = Guest.new("Elton", "I'm still standing", 1, 60)
        @guest1 = Guest.new("Freddie", "Under Pressure", 4, 50)
        @guest2 = Guest.new("Bruce", "Can We Fix It", 2, 25)
        @guest3 = Guest.new("Cher", "Believe", 3, 60)
        @guest4 = Guest.new("Noel", "Chandelier", 2, 65)
        @guest5 = Guest.new("Prince", "Wait and Bleed", 4, 70)
        @guest6 = Guest.new("Jay-Z", "Song 2", 3, 100)

        @song1 = Song.new("Elton John", "I'm still standing", 5)
        @song2 = Song.new("Queen", "Under Pressure", 5)
        @song3 = Song.new("Cher", "Believe", 2)
        @song4 = Song.new("Bruce Springsteen", "Born in the USA", 1)
        @song5 = Song.new("Blur", "Song 2", 2)
        @song6 = Song.new("Lionel Ritchie", "Hello", 2)
        @song7 = Song.new("Adele", "Hello", 5)
        @song8 = Song.new("Sia", "Chandelier", 5)
        @song9 = Song.new("Baccara", "Yes Sir, I Can Boogie", 3)
        @song10 = Song.new("Chic", "Everybody Dance", 2)
        @song11 = Song.new("Bob the Builder", "Can We Fix It", 2)
        @song12 = Song.new("Tenacious D", "Beelzeboss", 3)
        @song13 = Song.new("Slipknot", "Wait and Bleed", 4)
        @song14 = Song.new("Barenaked Ladies", "One Week", 3)
        @song15 = Song.new("Red Hot Chilli Peppers", "Under the Bridge", 3)
        @song16 = Song.new("Muse", "Plug In Baby", 4)
        @song17 = Song.new("Childish Gambino", "This Is America", 4)
        @song18 = Song.new("Macklemore", "Can't Hold Us", 4)
        @song19 = Song.new("Clarence Carter", "Strokin'", 3)
        @song20 = Song.new("Talking Heads", "Pyscho Killer", 4)

        @song_book = [@song1, @song2, @song3, @song4, @song5, @song6, @song7, 
                        @song8, @song9, @song10, @song11, @song12, @song13, 
                        @song14, @song15, @song16, @song17, @song18, @song19, 
                        @song20]
    
    end

    def test_rooms_have_theme
        assert_equal("Under the sea", @room1.theme())
    end

    def test_rooms_have_defined_capacity
        assert_equal(5, @room1.capacity())
    end

    def test_rooms_have_song_queue
        assert_equal([], @room1.song_queue())
    end

    def test_add_song_to_queue
        @room1.add_song(@song1)
        assert_equal(1, @room1.song_queue.length())
    end


    # needs heavy refactoring
    def test_song_by_artist
        @room1.add_song(@song2)
        song_artists = @room1.song_queue.map { |song| song.artist}
        artist_for_song = song_artists[0]
        assert_equal("Queen", artist_for_song)
    end

    def test_songbook_has_songs
        assert_equal(20, @song_book.length())
    end

    def test_songs_can_be_added_to_song_queue__all_songs
        @room1.add_all_songs(@song_book, @room1.song_queue)
        assert_equal(20, @room1.song_queue.length())
    end

    def test_rooms_start_with_empty_guest_hash
        assert_equal([], @room1.guests_in_room())
    end
  
    def test_number_of_guests_checked_into_room__single
        @room1.check_in(@guest1)
        assert_equal(1, @room1.number_of_guests())
    end

    def test_number_of_guests_checked_into_room__multiple
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        assert_equal(2, @room1.number_of_guests())
    end

    def test_guests_cant_enter_if_room_full
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        assert_equal(5, @room1.number_of_guests())
    end

    def test_guests_can_be_checked_out
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        @room1.check_in(@guest4)
        @room1.check_in(@guest5)
        @room1.check_in(@guest1)
        @room1.check_out(@guest2)
        @room1.check_out(@guest3)
        assert_equal(3, @room1.number_of_guests())
    end



    # def test_time_is_up_empty_the_room
        
    #     @room1.check_in(@guest1)
    #     @room1.check_in(@guest2)
    #     @room1.check_in(@guest3)
    #     p "Your five minute countdown is on!"
    #     @room1.time_up()
    #     assert_equal(0, @room1.number_of_guests())
    # end


end