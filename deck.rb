require "./card.rb"

class Deck

    attr_accessor :cards

    def initialize()

        @cards = []


        suits = ["Clubs", "Spades", "Hearts", "Diamonds"]

        #For each suit, create 13 cards
        suits.each do |suit|

            for i in 1..13

                self.cards.push(Card.new(suit, i))
                
            end

        end

    end

    #Randomize the deck
    def shuffle_cards()

        self.cards = cards.shuffle()

    end

    def split()

        #Shuffle the cards
        shuffle_cards()

        #Return [HALF OF THE DECK, SECOND HALF OF THE DECK] in an array
        return [self.cards[0..25], self.cards[26..51]]
    end

    def to_s
        cards.each{ |card| puts card }
    end

end
