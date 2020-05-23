class BarTab

attr_reader :name
attr_accessor :amount

def initialize(name, amount)
    @name = name
    @amount = Hash.new(0)
end


end