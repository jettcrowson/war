require "./deck"
require "./pot"

class Game

    attr_accessor :hand1, :hand2
    attr_accessor :round_winner, :no_winner, :winning_player
    attr_accessor :card1, :card2, :deck, :pot

    def initialize(hand1, hand2)

        @deck = Deck.new()
        @pot = Pot.new()

        @hand1 = hand1
        @hand2 = hand2

        @no_winner = true

        @winning_player = 0

        @round_winner = 1

    end

    def play_round()

        self.card2 = hand2.top_card
        self.card1 = hand1.top_card

        pot.add(card1)
        pot.add(card2)

        if compare_cards(card1, card2) == 0

            war()
            
        elsif compare_cards(card1, card2) == 1


            win_pot(hand1)

            self.round_winner = 1

        else

            win_pot(hand2)

            self.round_winner = 2
        
        end

        check_for_winner()
        
        hand1.shuffle_hand
        hand2.shuffle_hand
    end

    def war()

        puts "----- War! -----"
        puts "Player 1: #{card1} | Player 2: #{card2}"

        at_war = true

        while at_war

            if hand1.cards_length(hand1.cards) <= 2
                puts "Player 1 doesn't have enough cards to go into war. Player 2 wins."
                hand1.cards.each{ |card| pot.add(hand1.top_card)}
                win_pot(hand2)

                at_war = false

                check_for_winner()

                break
            elsif hand2.cards_length(hand2.cards) <= 2
                puts "Player 2 doesn't have enough cards to go into war. Player 1 wins."
                hand2.cards.each{ |card| pot.add(hand2.top_card)}
                win_pot(hand1)

                at_war = false

                check_for_winner()

                break
            else
                pot.add(hand1.top_card)
                pot.add(hand2.top_card)
                pot.add(hand1.top_card)
                pot.add(hand2.top_card)
            end



                
            puts "Player 1 draws a card and places it in the pot. He draws another card, the #{pot.player1.to_s}"
            puts "Player 2 draws a card and places it in the pot. He draws another card, the #{pot.player2.to_s}"

            if compare_cards(pot.player1, pot.player2) != 0
                if compare_cards(pot.player1, pot.player2) == 1
                    self.round_winner = 1
                    win_pot(hand1)

                    puts "Player 1 wins this round of war!"
                else
                    self.round_winner = 2
                    win_pot(hand2)

                    puts "Player 2 wins this round of war!"
                end

                at_war = false
            end

        end

        puts "----- End War -----"
    
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

    def win_pot(player)
        player.absorb_pot(pot.cards)
        pot.empty_pot
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
