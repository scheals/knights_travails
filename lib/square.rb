# frozen_string_literal: true

# This class handles a square on a board.
class Square
  attr_accessor :left, :right, :top, :bottom
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def chess_notation
    letters = %w[a b c d e f g h]
    [letters[coordinates[0]], coordinates[1] + 1].join
  end
end
