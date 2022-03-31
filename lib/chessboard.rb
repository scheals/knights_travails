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

  def reset_board
    board = []
    (0...8).to_a.repeated_permutation(2) { |permutation| board << create_square(permutation) }
    @board = board
  end

  def knight_moves(start, target)
    starting_square = find_square(create_knight(start).current_position)
    traversed = search_path(starting_square, target)
    puts path_message(traversed.first, traversed.last)
    reset_board
  end

  def generate_possible_squares
    possible_moves(knight).map { |move| find_square(move) }.reject(&:predecessor)
  end

  def link_predecessors(squares, predecessor)
    squares.each do |square|
      square.predecessor = predecessor
    end
  end

  def retrace_steps(start, target)
    predecessor = target.predecessor
    steps = [target]
    until start == predecessor
      break if predecessor.nil?

      steps << predecessor
      predecessor = predecessor.predecessor
    end
    steps << start
    steps.reverse.join(' to ')
  end

  def search_path(start, target)
    queue = [start]
    traversed = []
    until queue.empty?
      knight.current_position = queue.shift.coordinates
      square = find_square(knight.current_position)
      traversed << square
      break if knight.current_position == target

      link_predecessors(generate_possible_squares, square).each { |possible_square| queue << possible_square }
    end
    traversed
  end

  def path_message(start, target)
    "Here's your path for #{start} to #{target}:\n#{retrace_steps(start, target)}"
  end

  def create_knight(starting_position)
    @knight = Knight.new(starting_position)
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
