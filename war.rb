require "./deck"
require "./card"
require "./hand"
require "./game"

deck = Deck.new()
deck.shuffle_cards

player1 = Hand.new(deck.split[0])
player2 = Hand.new(deck.split[1])

game = Game.new(player1, player2)

puts deck.cards

while game.no_winner == true

    game.play_round()
    
    puts "Round: Winner is player #{game.round_winner} | Hand 1 has #{game.hand1.cards.length} cards | Hand 2 has #{game.hand2.cards.length} cards | Hand 1 card is #{game.card1} | Hand 2 card is #{game.card2}"
    sleep 0.01
end
