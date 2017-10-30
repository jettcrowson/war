require "./deck"
require "./hand"
require "./game"

deck = Deck.new()
player1 = Hand.new(deck.split[0])
player2 = Hand.new(deck.split[1])

game = Game.new(player1, player2)

puts game

