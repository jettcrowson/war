require "./deck"

class Game

    attr_accessor :hand1, :hand2, :round_winner, :no_winner, :winning_player, :card1, :card2

    def initialize(hand1, hand2)
        @deck = Deck.new()
        @deck.shuffle_cards

        @hand1 = hand1
        @hand2 = hand2

        @no_winner = true

        @winning_player = 0

        @round_winner = 0
    end

    def play_round()

        self.card2 = hand2.top_card
        self.card1 = hand1.top_card

        if compare_cards(card1, card2) == 1
            hand1.cards.push(card1, card2)
            self.round_winner = 1
        else
            hand2.cards.push(card1, card2)
            self.round_winner = 2
        end
        
        check_for_winner()
    end

    def compare_cards(card1, card2)
        return card1.value > card2.value ? 1 : 2
    end

    def check_for_winner()
        if hand1.cards.length == 0
            no_winner = false
            self.winning_player = 2
        elsif hand2.cards.length == 0
            no_winner = false
            self.winning_player = 1
        else
            self.winning_player = 0
        end
    end



end
