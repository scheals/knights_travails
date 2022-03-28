# frozen_string_literal: true

# This class handles a knight Chess piece.
class Knight
  attr_reader :starting_position

  def initialize(starting_position)
    @current_position = starting_position
  end

  def move(target)
    return nil unless valid_move?(target)

    @current_position = target
  end

  def possible_moves
    offsets.map do |offset|
      possible_positions = []
      possible_positions << @current_position[0] + offset[0]
      possible_positions << @current_position[1] + offset[1]
      possible_positions
    end
  end

  def offsets
    offsets = []
    [-1, -2, 1, 2].permutation(2) { |permutation| offsets << permutation }
    offsets.filter { |permutation| permutation[0].abs != permutation[1].abs }
  end

  def valid_move?(target)
    return true if possible_moves.include?(target)

    false
  end
end
