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

    def test_song_has_artist
        assert_equal("Elton John", @song.artist())
    end

    def test_song_has_name
        assert_equal("I'm still standing", @song.title)
    end

    def test_song_has_difficulty_level
        assert_equal(5, @song.difficulty_level)
    end
end