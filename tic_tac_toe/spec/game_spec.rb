require 'spec_helper.rb'

module TicTacToe
  describe Game do

    let(:bob) { Player.new({color: "X", name: "Bob"}) }
    let(:frank) { Player.new({color: "O", name: "Frank"}) }

    context "#initialize" do
      it "randomly selects a current player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.current_player).to eq frank
      end

      it "randomly selects other player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.other_player).to eq bob
      end
    end

    context "#switch_players" do
      it "switches players" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.current_player).to eq frank
        expect(game.other_player).to eq bob
        game.switch_players
        expect(game.current_player).to eq bob
        expect(game.other_player).to eq frank
      end
    end

    context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new([bob, frank])
        game.stub(:current_player) { bob }
        message = "Bob: Enter a number between 1 and 9 to make your move"
        expect(game.solicit_move).to eq message
      end
    end

    context "#get_move" do
      it "converts human_move of '1' to [0, 0]" do
        game = Game.new([bob, frank])
        expect(game.get_move("1")).to eq [0, 0]
      end

      it "converts human_move of '7' to [0, 2]" do
        game = Game.new([bob, frank])
        expect(game.get_move("7")).to eq [0, 2]
      end
    end

    context "#game_over_message" do
      it "returns winning message if board has a winner" do
        game = Game.new([bob, frank])
        game.stub(:current_player) { bob }
        game.board.stub(:game_over) { :winner }
        expect(game.game_over_message).to eq "Bob won!"
      end

      it "returns draw message if board is a draw" do
        game = Game.new([bob, frank])
        game.board.stub(:game_over) { :draw }
        expect(game.game_over_message).to eq "The game ended in a draw"
      end
    end

  end
end
