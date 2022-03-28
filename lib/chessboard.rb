# frozen_string_literal: true

# This class handles a chessboard.
class Chessboard
  attr_reader :board, :knight

  def initialize
    @board = generate_board
  end

  def generate_board
    board = []
    (0...8).to_a.repeated_permutation(2) { |permutation| board << permutation }
    board
  end

  def put(knight)
    @knight = knight
  end

  def move(piece, target)
    attempted_move = piece.move(target)
    return 'Invalid move!' if attempted_move.nil? || out_of_bounds?(attempted_move)

    target
  end

  def out_of_bounds?(coordinates)
    return false if board.include?(coordinates)

    true
  end
end
