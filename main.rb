# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/knight'

knight = Knight.new
board = Chessboard.new
board.put(knight)
knight.moves([0, 0], [1, 2])
