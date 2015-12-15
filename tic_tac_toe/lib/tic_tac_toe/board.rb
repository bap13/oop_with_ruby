module TicTacToe
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    def diagonals
      [
        Array.new(3).fill { |i| get_cell(i, i) },
        Array.new(3).fill { |i| get_cell(i, 2 - i) }
      ]
    end

    def winner?
      winning_positions.each do |position|
        next if winning_position_values(position).all_empty?
        return true if winning_position_values(position).all_same?
      end
      false
    end

    def winning_position_values(position)
      position.map(&:value)
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
