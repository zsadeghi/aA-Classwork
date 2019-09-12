 require_relative 'piece.rb'

class Board

  attr_accessor :rows
  
  def initialize
    piece = Piece.new(color, board, pos)
    @rows = Array.new(8) { Array.new(8) } 
    # @display = display
  end
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    #start_pos - error if there is no [iece on start position
    if valid_pos?(end_pos)
      occupant = self[start_pos]
      self[end_pos] = occupant
      self[start_pos] = nil
    else
      raise "Nonononono"
    end
  end

  def valid_pos?(pos)
    row, col = pos
    arr = (0..7).to_a
    if arr.include?(row) && arr.include?(col)
      return true
    end

    false  
    # if !((pos[0] < 0 || pos[0] > 7) || (pos[1] < 0 || pos[1] > 7))
    #     return false
    # end
    # true
  end

  def add_piece(piece, pos) #
    self[pos] = piece
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

  def move_piece!(start_pos, end_pos)

  end

  private

  # @sentinel = NullPiece

end



