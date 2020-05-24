require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class GuestTest < MiniTest::Test

    def setup
        @guest = Guest.new("Elton", "I'm still standing", 1, 60)
        @guest1 = Guest.new("Freddie", "Under Pressure", 4, 50)
        @guest2 = Guest.new("Bruce", "Can We Fix It", 2, 25)
        @guest3 = Guest.new("Cher", "Believe", 3, 60)
    end

    def test_guest_has_name
        assert_equal("Elton", @guest.name())
    end

    def test_guest_has_favourite_song
        assert_equal("I'm still standing", @guest.favourite_song())
    end
    
    def test_guest_skill_level
        assert_equal(1, @guest.skill_level())
    end

    # def test_guest_can_find_song_in_queue
    #     # @songs.find_a_song()
    # end
    
    def test_guest_has_wallet
        assert_equal(50, @guest1.wallet())
    end

    # def test_guest_can_sing_favourite_song
    #     assert_equal("Believe", @guest3.favourite_song())
end