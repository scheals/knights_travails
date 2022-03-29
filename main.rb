# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/knight'

def notation_translator(possible_moves)
  translatorium = %w[a b c d e f g h]
  return possible_moves.map { |position| [translatorium[position.first], position[1] + 1].join } if possible_moves.length > 2

  [translatorium[possible_moves.first], possible_moves[1] + 1].join
end
knight = Knight.new([3, 3])
board = Chessboard.new
# p knight.move([1, 2])
# p knight.move([0, 2])
puts "Possible moves for: #{notation_translator(knight.current_position)} are: \n#{notation_translator(knight.possible_moves)}"
puts "Possible moves for: #{knight.current_position} are: \n#{knight.possible_moves}"
board.put(knight)
p board.possible_moves(knight)
# p board.move(knight, [2, 4])
# p board.move(knight, [1, 3])
# p board.knight_moves([2, 4])
# p board.knight_moves([1, 2])
# p board.knight_moves([0, 0])
p board.knight_moves([7, 7])
