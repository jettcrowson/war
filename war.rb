require "./deck"
require "./card"
require "./hand"
require "./game"
require 'io/console'

deck = Deck.new()
deck.shuffle_cards

player1 = Hand.new(deck.split[0])
player2 = Hand.new(deck.split[1])

game = Game.new(player1, player2)

i = 0
puts " _____"
puts "/5    \\"

while game.no_winner
    i += 1
    game.play_round()

    puts "----- Round #{i} -----"
    STDIN.getch 
    puts "You draw a #{game.card1}"
    STDIN.getch 
    puts "Your opponent draws a #{game.card2}"
    STDIN.getch 
    puts game.round_winner == 1 ? "You win this round" : "Your oppenent wins this round"
    puts  "You have #{game.hand1.cards.length} cards | Your opponent has #{game.hand2.cards.length} cards "
    STDIN.getch 
    
end

puts "Ya boi player #{game.winning_player} won"