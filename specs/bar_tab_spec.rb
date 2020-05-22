require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class BarTabTest < MiniTest::Test

    def setup
        @bar_tab = BarTab.new("Elton", 3000)
    end

end