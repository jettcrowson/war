require "./card.rb"

class Deck

    attr_accessor :cards

    def initialize()
        @cards = []
        suits = ["Clubs", "Spades", "Hearts", "Diamonds"]

        suits.each do |suit|
            for i in 1..13
                self.cards.push(Card.new(suit, i))
            end
        end
    end

    def shuffle_cards()
        self.cards = cards.shuffle()
    end

    def split()
        shuffle_cards()
        return [self.cards[0..25], self.cards[26..51]]
    end

    def to_s
        cards.each{ |card| puts card }
    end

end
