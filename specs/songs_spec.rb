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
        @song2 = Song.new("Queen", "Under Pressure", 5)
        @song3 = Song.new("Cher", "Believe", 2)
        @song4 = Song.new("Bruce Springsteen", "Born in the USA", 1)
        @song5 = Song.new("Blur", "Song 2", 2)
        @song6 = Song.new("Lionel Ritchie", "Hello", 2)
        @song7 = Song.new("Adele", "Hello", 5)
        @song8 = Song.new("Sia", "Chandelier", 5)
        @song9 = Song.new("Baccara", "Yes Sir, I Can Boogie", 3)
        @song10 = Song.new("Chic", "Everybody Dance", 2)
        @song11 = Song.new("Ed Sheeran", "Shape of You", 4)
        @song12 = Song.new("Tenacious D", "Beelzeboss", 3)
        @song13 = Song.new("Slipknot", "Wait and Bleed", 4)
        @song14 = Song.new("Barenaked Ladies", "One Weel", 3)
        @song15 = Song.new("Red Hot Chilli Peppers", "Under the Bridge", 3)
        @song16 = Song.new("Muse", "Plug In Baby", 4)
        @song17 = Song.new("Childish Gambino", "This Is America", 4)
        @song18 = Song.new("Macklemore", "Can't Hold Us", 4)
        @song19 = Song.new("Clarence Carter", "Strokin'", 3)
        @song20 = Song.new("Talking Heads", "Pyscho Killer", 4)
        @guest1 = Guest.new("Freddie", "Under Pressure", 4)
        @guest2 = Guest.new("Bruce", "Can We Fix It", 2)
        @guest3 = Guest.new("Cher", "Believe", 3)

        @song_book = [@song, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9, @song10, @song11, @song12, @song13, @song14, @song15, @song16, @song17, @song18, @song19, @song20]
    

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
    
    def test_song_book_has_songs
        assert_equal(20,@song_book.size())
    end
    

end