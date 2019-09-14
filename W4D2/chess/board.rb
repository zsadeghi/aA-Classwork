require_relative 'piece.rb'

class Board
  
  def initialize(display)
    @rows = Array.new(8) {Array.new(8)}
    @display = display
    
  end
  
  def[](pos)
  end

  def[]=(pos, value)
  end

  def move_piece(color, start_pos, end_pos)

  end

  def valid_pos?(pos)
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)

  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end
  private

  @sentinel = NullPiece

end
