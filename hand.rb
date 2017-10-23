class Hand

	attr_accessor :cards

	def initialize (cards)
		@cards = cards
	end

	def top_card()
		top_card = self.cards[0]
		self.cards = self.cards[1..self.cards.length - 1]
		return top_card
    end


end