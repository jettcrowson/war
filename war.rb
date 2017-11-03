require "./deck"
require "./card"
require "./hand"
require "./game"
require './Keypress'
require "./card_printer"

deck = Deck.new()
deck.shuffle_cards

player1 = Hand.new(deck.split[0])
player2 = Hand.new(deck.split[1])

game = Game.new(player1, player2)

i = 0
puts " _____"
puts "/5    \\"

def clear
    system "clear" or system "cls"
end

while game.no_winner
    i += 1
    game.play_round()

    clear
    puts "----- Round #{i} -----"
    Keypress.wait
    puts "You draw a #{game.card1}"
    puts "\n"
    CardPrinter.print_card(game.card1)
    Keypress.wait
    clear
    puts "----- Round #{i} -----"
    puts "Your opponent draws a #{game.card2}"
    puts "\n"
    CardPrinter.print_cards(game.card1, game.card2)
    Keypress.wait
    puts "\n" 
    puts game.round_winner == 1 ? "You win this round" : "Your oppenent wins this round"
    puts  "You have #{game.hand1.cards.length} cards | Your opponent has #{game.hand2.cards.length} cards "
    Keypress.wait 
    
end



puts "Ya boi player #{game.winning_player} won"