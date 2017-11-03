class Pot
    attr_accessor :cards

    def initialize
        @cards = []
    end

    #Add a card
    def add(card)
        cards.push(card)
    end

    #Empty the pot. Should only be used after someone wins the pot
    def empty_pot
        self.cards = []
    end

    #Whichever card has been most recently added to the pot are the cards actually in play. This returns player 1's card
    def player1
        return cards[cards.length - 2]
    end

    #Whichever card has been most recently added to the pot are the cards actually in play. This returns player 1's card
    def player2
        return cards[cards.length - 1]
    end

    def to_s
        str = ["#############"]
        cards.each{ |card| str.push(card.to_s)}
        return str.join("\n")
    end
end
