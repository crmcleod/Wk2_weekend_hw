require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class GuestTest < MiniTest::Test

    def setup
        @guest = Guest.new("Elton", "I'm still standing", 1)
    end

end