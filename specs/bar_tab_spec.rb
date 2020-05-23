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

    def test_bar_tab_has_name
        assert_equal("Elton", @bar_tab.name())
    end

    def test_bar_tab_has_value
        assert_equal(3000, @bar_tab.amount())
    end

end