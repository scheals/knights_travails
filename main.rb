# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

knight = Knight.new
board = Board.new
board.put(knight)
knight.moves([0, 0], [1, 2])
