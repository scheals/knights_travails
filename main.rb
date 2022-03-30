# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/knight'

knight = Knight.new([3, 3])
board = Chessboard.new
board.put(knight)
board.knight_moves([0, 0])
board.knight_moves([0, 0])
board.knight_moves([7, 7])
board.knight_moves([6, 6])
40.times { board.knight_moves([rand(7), rand(7)])}
