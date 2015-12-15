require 'spec_helper'

module TicTacToe
  describe Board do
    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid).to have(3).things
      end

      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row).to have(3).things
        end
      end

      it "returns the grid" do
        board = Board.new(grid: "Blah")
        expect(board.grid).to eq "Blah"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x, y) coordinate" do
        grid = [["","",""], ["","","Something"], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq "Something"
      end
    end

    context "#set_cell" do
      it "changes the value of the cell at (x, y) coordinate" do
        Cat = Struct.new(:value)
        grid =  [["","",""], ["","", Cat.new("Hello")], ["", "", ""]]
        board = Board.new(grid: grid)
        board.set_cell(2, 1, "Meow")
        expect(board.get_cell(2, 1).value).to eq "Meow"
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        board.stub(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { false }
        expect(board.game_over).to eq false
      end

      it "returns :winner when row has objects with values that are the same" do
        grid = [[x_cell, y_cell, x_cell],
                [x_cell, x_cell, x_cell],
                [y_cell, y_cell, empty]]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when column has objects with values that are the same" do
        grid = [[x_cell, y_cell, y_cell],
                [x_cell, x_cell, y_cell],
                [x_cell, y_cell, empty]]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonal has objects with values that are the same" do
        grid = [[empty, y_cell, x_cell],
                [x_cell, x_cell, y_cell],
                [x_cell, y_cell, empty]]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns false when there are three empty cells in a winning position" do
        grid = [[empty, y_cell, x_cell],
                [x_cell, empty, y_cell],
                [x_cell, y_cell, empty]]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsey
      end


      it "returns :draw when all cells are filled" do
        grid = [[x_cell, y_cell, y_cell],
                [y_cell, x_cell, x_cell],
                [y_cell, x_cell, y_cell]]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false if there is no winner or draw" do
        grid = [[x_cell, y_cell, y_cell],
                [y_cell, x_cell, x_cell],
                [y_cell, empty, y_cell]]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsey
      end
    end
  end
end
