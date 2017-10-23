require "./deck"
require "./card"
require "./hand"
require "./game"

deck = Deck.new()
deck.shuffle_cards

player1 = Hand.new(deck.split[0])
player2 = Hand.new(deck.split[1])

game = Game.new(player1, player2)

while game.no_winner == true

    game.play_round()
    puts "###"
    puts "Round played. Winner is #{game.round_winner}"
    puts "Player 1: #{game.card1.value}"
    puts "Player 2: #{game.card2.value}"

end
