# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/knight'

knight = Knight.new
board = Chessboard.new
p knight.move([0, 0], [1, 2])
p knight.move([0, 0], [-1, -2])
p knight.move([0, 0], [1, -2])
p knight.move([0, 0], [-1, 2])
p knight.move([0, 0], [2, 1])
p knight.move([0, 0], [-2, -1])
p knight.move([0, 0], [2, -1])
p knight.move([0, 0], [-2, 1])
p knight.move([0, 0], [1, 4])
board.put(knight)
knight.moves([0, 0], [1, 2])
