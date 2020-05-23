require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar_tab')
require_relative('../guests')
require_relative('../rooms')
require_relative('../songs')

class BarTabTest < MiniTest::Test

    def setup
        @bar_tab1 = BarTab.new("Elton", 3000)
        @bar_tab2 = BarTab.new("Freddie", 100)
    end

    def test_bar_tab_has_name
        assert_equal("Elton", @bar_tab1.name())
    end

    def test_bar_tab_has_value
        assert_equal(3000, @bar_tab1.amount())
    end

end