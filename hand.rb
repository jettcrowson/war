class Hand

	attr_accessor :cards

	#Each hand only needs their cards
	def initialize (cards)

		@cards = cards

	end

	#Put a card into play for comparing
	def top_card()

		#Find out whatever the front card is
		top_card = self.cards[0]

		#Get rid of the front card, so it only exists in the top_card variable (So we don't get duplicates)
		cards.shift

		#Return the card, which is the only instance of that card
		return top_card

    end

	#Add a card to the hand
	def add_card(card)
		
		cards.push(card)
	
	end

	#Return the length of the cards array
	def cards_length(array)
		
		return array.length
		
	end

	#Shuffle the individual hand
	def shuffle_hand()

		self.cards = cards.shuffle
	
	end

	#Copy everything from the pot into the hands cards
	#Should always be followed by a pot.empty_pot() so as not to create duplicates
	def absorb_pot(pot)

		pot.each{ |card| cards.push(card)}
	
	end
	
	def to_s

		str = []

		cards.each{ |card| str.push("#{card.value} of #{card.suit}, ")}

		return str.join("")
		
	end


end