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

  def knight_moves(target)
    queue = [knight.current_position]
    traversed = []
    until queue.empty?
      knight.current_position = queue.shift
      knight.current_position == target ? break : traversed << knight.current_position

      queue += possible_moves(knight)
      queue.reject! { |move| traversed.include?(move) }
    end
    traversed
  end

  # def knight_moves(target)
  #   queue = [knight.current_position]
  #   traversed = []
  #   until queue.empty?
  #     if queue.first.is_a?(String)
  #       traversed << queue.shift
  #       next
  #     end
  #     knight.current_position = queue.shift
  #     knight.current_position == target ? traversed << "<- Got one !" : traversed << knight.current_position
  #     queue << "Moves from: #{knight.current_position}"
  #     queue += possible_moves(knight)
  #     queue.reject! { |move| traversed.include?(move) }
  #   end
  #   traversed
  # end

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

  def create_square(coordinates)
    Square.new(coordinates)
  end
end
