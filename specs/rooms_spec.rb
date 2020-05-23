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
        @song1.new("Elton John", "I'm still standing", 5)
    end


end