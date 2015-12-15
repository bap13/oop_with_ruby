require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic-Tac-Toe"
player1 = TicTacToe::Player.new({color: "X", name: "Brett"})
player2 = TicTacToe::Player.new({color: "O", name: "Guillermo"})
players = [player1, player2]
TicTacToe::Game.new(players).play
