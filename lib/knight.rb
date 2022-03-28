# frozen_string_literal: true

# This class handles a knight Chess piece.
class Knight
  def move(start, target)
    return 'Invalid move!' unless valid_move?(start, target)

    "Moved from #{start} to #{target}."
  end

  def valid_move?(start, target)
    return true if [[1, 2], [2, 1]].include?(calculate_distances(start, target))

    false
  end

  def calculate_distances(start, target)
    distances = []
    distances << (start[0] - target[0]).abs
    distances << (start[1] - target[1]).abs
    distances
  end
end
