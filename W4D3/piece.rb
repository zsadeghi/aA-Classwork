require_relative 'board.rb'

class Piece
  attr_accessor :piece, :pos
  def initialize(piece, pos)
    row, col = pos
    @piece = piece
    @pos = []
  end

  def moves(start_pos)
    moves_arr = []
    arr << [3,3]
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private 
  def move_into_check?(end_pos)
  end

end

