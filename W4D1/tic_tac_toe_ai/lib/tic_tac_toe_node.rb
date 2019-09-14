require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.over? && !@board.winner.nil? && @board.winner != evaluator
    return false if @board.winner.nil? || @board.winner == evaluator
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    result = []
    (0...3).each do |x|
      (0...3).each do |y|
        pos = [x, y]
        if board.empty?(pos)
          state = @board.dup
          state[pos] = next_mover_mark
          curr_mark = next_mover_mark == :x ? :o : :x 
          child = TicTacToeNode.new(state, curr_mark, pos)
          result << child
        end
      end
    end
    result
  end
  
end
