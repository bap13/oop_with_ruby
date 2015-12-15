require 'spec_helper'

module TicTacToe
  describe Player do
    context "#initialize" do
      it "raises an exception when initialized with an invalid hash" do
        expect { Player.new({}) }.to raise_error(KeyError)
      end

      it "does not raise an error when initialized with a valid hash" do
        input = { color: "red", name: "Guillermo" }
        expect { Player.new(input) }.to_not raise_error
      end
    end

    context "#color" do
      it "returns the color" do
        input = { color: "red", name: "Guillermo" }
        player = Player.new(input)
        expect(player.color).to eq input[:color]
      end
    end

    context "#name" do
      it "returns the name" do
        input = { color: "red", name: "Guillermo" }
        player = Player.new(input)
        expect(player.name).to eq input[:name]
      end
    end
  end
end
