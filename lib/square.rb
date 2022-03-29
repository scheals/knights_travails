# frozen_string_literal: true

# This class handles a square on a board.
class Square
  attr_accessor :left, :right, :top, :bottom
  attr_reader :coordinates

  def initialize(letter, number)
    @coordinates = [letter, number]
    @left, @right, @top, @bottom = nil
  end
end
