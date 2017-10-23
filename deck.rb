require "./card.rb"

class Deck

    attr_reader :cards

    def initialize()
        @cards = []
        suits = ["Club", "Spade", "Heart", "Diamond"]

        suits.each do |suit|
            for i in 1..14
                cards.push(Card.new(suit, i + 1))
            end
        end
    end

    def shuffle_cards()
        @cards = @cards.shuffle
    end

    def split()
        return [@cards[0..25], @cards[26..51]]
    end

end
