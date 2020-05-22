require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class SongTest < MiniTest::Test

    def setup
        @song = Song.new("Elton John", "I'm still standing", 5)
    end

end