require_relative 'board.rb'

class Piece
  
  def initialize(color, pos, board)

    @color = color
    @board = Board.new()
    @pos = []

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

