require "./deck"
require "./pot"
require './Keypress'
require './Keypress'
require "./card_printer"

class Game

    #Hand1 and Hand2 are the players
    attr_accessor :hand1, :hand2

    #round_winner is just for printing, no_winner is for the game loop, and winning_player is for the overall game winner
    attr_accessor :round_winner, :no_winner, :winning_player
    attr_accessor :card1, :card2, :deck, :pot

    def initialize(hand1, hand2)

        @deck = Deck.new()
        @pot = Pot.new()

        #set the hands equal to the hands passed in when the game was created. These hands both have half the deck
        @hand1 = hand1
        @hand2 = hand2

        #While this is true, the game loop will run
        @no_winner = true

        @winning_player = 0
        @round_winner = 1

    end
    #The game loop, run until there is a winner
    def play_round()

        #Set the cards beacause each time a hand grabs the top card, it removes it from their cards
        #We cant have the top card changing each time we want to compare it
        self.card2 = hand2.top_card
        self.card1 = hand1.top_card

        #Add the two cards to the pot
        pot.add(card1)
        pot.add(card2)

        #If theyre are of the same value, go to war
        if compare_cards(card1, card2) == 0

            war()

        #If hand1's card has a higher value
        elsif compare_cards(card1, card2) == 1

            #Add the cards from the pot to his cards
            #removes them from the pot also
            win_pot(hand1)

            #Used for printing
            self.round_winner = 1
        else

            win_pot(hand2)

            self.round_winner = 2
        
        end

        #If someone has 0 cards, make sure to set no_winner to false so that the loop doesn't run
        check_for_winner()
        
        #Shuffle each hand
        hand1.shuffle_hand
        hand2.shuffle_hand
    end
    
    def clear
        system "clear" or system "cls"
    end

    #called when each player draws the same value card
    def war()
        clear
        Keypress.wait
        puts "You draw a #{card1}"
        puts "\n"
        CardPrinter.print_card(card1)
        Keypress.wait
        clear
        puts "Your opponent draws a #{card2}"
        puts "\n"
        CardPrinter.print_cards(card1, card2)
        puts "\n"
        puts "You drew the same value cards! Go to war!"
        Keypress.wait
        clear
        puts "----- War! -----"
        puts "\n"
        Keypress.wait 
        
        #The war loop runs until the cards they draw are not equal to each other
        at_war = true

        while at_war

            #If hand1 does not have enough cards to go to war
            if hand1.cards_length(hand1.cards) <= 2

                puts "You don't have enough cards to go into war. Your opponent wins!"
                Keypress.wait
                clear 

                #transfer all of hand1's cards to the pot, and then let hand2 win the pot
                hand1.cards.each{ |card| pot.add(hand1.top_card)}
                win_pot(hand2)

                #Stop the war loop
                at_war = false

                #Set that there is a winner
                check_for_winner()

                #end the entire war method so it doesn't continue running
                break

            #Repeat for hand2
            elsif hand2.cards_length(hand2.cards) <= 2

                puts "Your opponent doesn't have enough cards to go into war. You win."
                Keypress.wait
                clear 

                hand2.cards.each{ |card| pot.add(hand2.top_card)}
                win_pot(hand1)

                at_war = false

                check_for_winner()

                break

            #If both hands have enough cards to go to war
            else

                #Add a face down card from each deck to the pot
                pot.add(hand1.top_card)
                pot.add(hand2.top_card)

                #Add the card the players are going to actually compare to the pot
                pot.add(hand1.top_card)
                pot.add(hand2.top_card)

            end
                
            puts "You draw a card and place it in the pot. You draw another card, the #{pot.player1.to_s}"
            puts "\n"
            CardPrinter.print_card(pot.player1)
            Keypress.wait 
            clear
            puts "----- War! -----"
            puts "Your opponent draws a card and places it in the pot. He draws another card, the #{pot.player2.to_s}"
            puts "\n"
            CardPrinter.print_cards(pot.player1, pot.player2)
            puts "\n"
            Keypress.wait 
            #If the cards being compared are not equal to each other
            if compare_cards(pot.player1, pot.player2) != 0

                #If hand1 has the higher value card
                if compare_cards(pot.player1, pot.player2) == 1

                    #Set hand1 to the winner and add the pot to his deck
                    self.round_winner = 1
                    win_pot(hand1)

                    puts "You win this round of war!"
                    Keypress.wait 
                #If hand2's card is higher
                else

                    #Set hand2 to the winner and give him the pot
                    self.round_winner = 2
                    win_pot(hand2)

                    puts "Your opponent wins this round of war!"
                    Keypress.wait 
                end

                #If the cards are not equal, end the war
                at_war = false

            end

        end
         puts  "You have #{hand1.cards.length} cards | Your opponent has #{hand2.cards.length} cards "
        puts "----- End War -----"
        Keypress.wait 
    
    end

    #Pass in two card objects to compare their values
    def compare_cards(card1, card2)

        #If their values are equal
        if card1.value == card2.value

            return 0

        #If card 1 has a higher value    
        elsif card1.value > card2.value

            return 1

        #If card 2 has a higher value
        else

            return 2

        end

    end

    #Checks to see if either player has an empty hand
    def check_for_winner()

        #If hand1 is empty
        if hand1.cards.length == 0

            #Stop the game loop
            self.no_winner = false

            #Set the winner to hand2
            self.winning_player = 2

        #If hand2 is empty
        elsif hand2.cards.length == 0

            #Stop the game loop
            self.no_winner = false

            #Set the winner to hand1
            self.winning_player = 1
            
        else

            #If neither hand has won, keep the winning player at 0, meaning noone
            self.winning_player = 0

        end

    end

    #Run each game loop to add the cards in the pot to whichever player is passed in
    def win_pot(player)

        #Copy over all of the cards from the pot to the players cards
        player.absorb_pot(pot.cards)

        #Empty the pot
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
