require "./deck"

class Game

    attr_accessor :hand1, :hand2, :round_winner, :no_winner, :winning_player, :card1, :card2, :deck, :pot

    def initialize(hand1, hand2)
        @deck = Deck.new()

        @hand1 = hand1
        @hand2 = hand2

        @no_winner = true

        @winning_player = 0

        @round_winner = 1
    end

    def play_round()

        self.card2 = hand2.top_card
        self.card1 = hand1.top_card

        if compare_cards(card1, card2) == 0
            hand1.add_card(card1)
            hand1.add_card(card2)
            self.round_winner = 1
        elsif compare_cards(card1, card2) == 1

            hand1.add_card(card1)
            hand1.add_card(card2)
            self.round_winner = 1
        else

            hand2.add_card(card1)
            hand2.add_card(card2)
            self.round_winner = 2
        
        end

        check_for_winner()
        
        hand1.shuffle_hand
        hand2.shuffle_hand
    end

    def compare_cards(card1, card2)
        if card1.value == card2.value
            return 0
        elsif card1.value > card2.value
            return 1
        else
            return 2
        end
    end

    def check_for_winner()
        if hand1.cards.length == 0
            self.no_winner = false
            self.winning_player = 2
        elsif hand2.cards.length == 0
            self.no_winner = false
            self.winning_player = 1
        else
            self.winning_player = 0
        end
    end

    def to_s
        str = []

        str.push("###")
        str.push("#{deck}")
        str.push("###")
        str.push("Total deck length: #{deck.cards.length}")
        str.push("###")
        str.push("#{hand1} \n Hand1 length: #{hand1.cards.length}")
        str.push("###")
        str.push("#{hand2} \n Hand2 length: #{hand2.cards.length}")

        return str.join("\n")
    end


end
