class Hand

	attr_accessor :cards

	def initialize (cards)
		@cards = cards
	end

	def top_card()
		top_card = self.cards[0]
		cards.shift
		return top_card
    end

    def add_card(card)
		cards.push(card)
    end

    def cards_length(array)
        return array.length
	end

	def shuffle_hand()
		self.cards = cards.shuffle
	end
	
	def to_s
		str = []

		cards.each{ |card| str.push("#{card.value} of #{card.suit}, ")}

		return str.join("")
	end


end