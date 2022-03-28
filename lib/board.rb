# frozen_string_literal: true

# This class handles a chessboard.
class Board
  def initialize
    @board = generate_chess_board
  end

  def generate_chess_board
    board = []
    (0...8).to_a.repeated_permutation(2) { |permutation| board << permutation }
    board
  end
end
