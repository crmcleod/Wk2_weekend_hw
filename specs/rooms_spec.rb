require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class RoomTest < MiniTest::Test

    def setup
        @room = Room.new("Under the sea", 5 )
        @song1 = Song.new("Elton John", "I'm still standing", 5)
        @guest1 = Guest.new("Freddie", "Under Pressure", 4)
        @guest2 = Guest.new("Bruce", "Bob the Builder", 2)
        @guest3 = Guest.new("Cher", "Believe", 3)
    end

    def test_rooms_have_theme
        assert_equal("Under the sea", @room.theme())
    end

    def test_rooms_have_defined_capacity
        assert_equal(5, @room.capacity())
    end

    def test_rooms_have_songbook
        assert_equal([], @room.songbook())
    end

    def test_rooms_start_with_empty_guest_hash
        assert_equal([], @room.guests_in_room())
    end

    def test_can_check_guest_in
        @room.check_in(@guest1)
        assert_equal("Freddie", @guest1.name())
    end
  
    def test_number_of_guests_checked_into_room__single
        @room.check_in(@guest1)
        assert_equal(1, @room.number_of_guests())
    end

    def test_number_of_guests_checked_into_room__multiple
        @room.check_in(@guest1)
        @room.check_in(@guest2)
        assert_equal(2, @room.number_of_guests())
    end

    def test_guests_cant_enter_if_room_full
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        assert_equal(5, @room.number_of_guests())
    end

    def test_guests_can_be_checked_out
        @room.check_in(@guest1)
        @room.check_in(@guest2)
        @room.check_in(@guest3)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_in(@guest1)
        @room.check_out(@guest2)
        @room.check_out(@guest3)

        assert_equal(3, @room.number_of_guests())
    end

end