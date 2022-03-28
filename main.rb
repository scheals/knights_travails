# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/knight'

knight = Knight.new([0, 0])
board = Chessboard.new
p knight.move([1, 2])
p knight.move([0, 2])
p knight.possible_moves
board.put(knight)
p board.move(knight, [2, 4])
p board.move(knight, [1, 3])
knight.moves([0, 0],[1, 2])
