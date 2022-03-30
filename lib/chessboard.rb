# frozen_string_literal: true

require_relative './square'

# This class handles a chessboard.
class Chessboard
  attr_reader :board, :knight

  def initialize
    @board = generate_board
  end

  def generate_board
    board = []
    (0...8).to_a.repeated_permutation(2) { |permutation| board << create_square(permutation) }
    board
  end
#rubocop: disable all
  def knight_moves(target)
    queue = [find_square(knight.current_position)]
    traversed = []
    predecessor = nil
    until queue.empty?
      knight.current_position = queue.shift.coordinates
      square = find_square(knight.current_position)
      square.predecessor ||= predecessor
      traversed << square
      break if knight.current_position == target

      predecessor = square
      possible_squares = possible_moves(knight).map { |move| find_square(move) }.reject(&:predecessor)
      possible_squares.each do |possible_square|
        possible_square.predecessor = predecessor
        queue << possible_square
      end
    end
    puts retrace_steps(traversed.first, traversed.last)
  end

  def retrace_steps(start, target)
    predecessor = target.predecessor
    steps = [target]
    until start == predecessor
      steps << predecessor
      predecessor = predecessor.predecessor
    end
    steps << start
    steps.reverse
  end

  def put(knight)
    @knight = knight
  end

  def move(piece, target)
    attempted_move = piece.move(target)
    return 'Invalid move!' if attempted_move.nil? || out_of_bounds?(attempted_move)

    target
  end

  def possible_moves(piece)
    piece.possible_moves.reject { |move| out_of_bounds?(move) }
  end

  def out_of_bounds?(coordinates)
    return false if board.any? { |square| square.coordinates == coordinates }

    true
  end

  def find_square(coordinates)
    board.find { |square| square.coordinates == coordinates }
  end

  def create_square(coordinates)
    Square.new(coordinates)
  end
end
