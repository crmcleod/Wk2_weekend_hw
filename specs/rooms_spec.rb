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
    end

    def test_rooms_have_theme
        assert_equal("Under the sea", @room.theme())
    end

    def test_rooms_have_defined_capacity
        assert_equal(5, @room.capacity())
    end

    def test_rooms_have_songbook
        assert_equal({}, @room.songbook)
    end
        

end