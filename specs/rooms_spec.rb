require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class RoomTest < MiniTest::Test

    def setup
        @room1 = Room.new("Under the sea", 5)
        @room2 = Room.new("Cloud 9", 10)
        @room3 = Room.new("Valhalla", 8)
        @room4 = Room.new("Lone Wolf", 1)
        @room5 = Room.new("Woodland", 20)
        @song1 = Song.new("Elton John", "I'm still standing", 5)
        @guest1 = Guest.new("Freddie", "Under Pressure", 4)
        @guest2 = Guest.new("Bruce", "Can We Fix It", 2)
        @guest3 = Guest.new("Cher", "Believe", 3)
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

    # def test_songs_can_be_added_to_song_queue
    #     assert_equal([])

    def test_rooms_start_with_empty_guest_hash
        assert_equal([], @room1.guests_in_room())
    end

    def test_can_check_guest_in
        @room1.check_in(@guest1)
        assert_equal("Freddie", @guest1.name())
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
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_in(@guest1)
        @room1.check_out(@guest2)
        @room1.check_out(@guest3)
        assert_equal(3, @room1.number_of_guests())
    end

    def test_time_is_up_empty_the_room
        
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        p "Your five minute countdown is on!"
        @room1.time_up()
        assert_equal(0, @room1.number_of_guests())
    end


end