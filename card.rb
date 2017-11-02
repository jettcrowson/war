class Card

    attr_accessor :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

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
