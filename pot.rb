class Pot
    attr_accessor :cards

    def initialize
        @cards = []
    end

    def add(card)
        cards.push(card)
    end

    def empty_pot
        self.cards = []
    end

    def player1
        return cards[cards.length - 2]
    end

    def player2
        return cards[cards.length - 1]
    end

    def to_s
        str = ["#############"]
        cards.each{ |card| str.push(card.to_s)}
        return str.join("\n")
    end
end
