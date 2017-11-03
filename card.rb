class Card

    attr_accessor :suit, :value

    #Each card should have a string suit and a numerical value, 1-13
    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    #Return VAL of SUITS, but convert val to it's respective name if it has one
    def to_s
			val = ""

			case value
				when 1
					val = "Ace"
				when 11
					val = "Jack"
				when 12
					val = "Queen"
				when 13
					val = "King"
				else
					val = value
			end

        return "#{val} of #{suit}"
    end

end
