# frozen_string_literal: true

# This class handles a chessboard.
class Chessboard
  def initialize
    @board = generate_board
  end

  def generate_board
    board = []
    (0...8).to_a.repeated_permutation(2) { |permutation| board << permutation }
    board
  end
end
