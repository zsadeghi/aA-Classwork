
require_relative "Polytreenode"
require 'byebug'

class KnightPathFinder

  POSSIBLE_MOVES = [[1,2], [1,-2], [-1, 2], [-1,-2], [2,1], [2, -1], [-2, 1], [-2, -1]]

  def initialize(start)
    @starting_pos = start
    @root_node = PolyTreeNode.new(start)
    @considered_positions = [start]
    build_move_tree(@root_node)
  end

  def self.valid_moves(pos)
    valid_moves = []
    x, y = pos
    POSSIBLE_MOVES.each do |(move_x, move_y)|
      new_pos = [x + move_x, y + move_y]
      valid_moves << new_pos if KnightPathFinder.good_position(new_pos)
    end
    valid_moves
  end

  def self.good_position(pos)
    x, y = pos
    x >= 0 && x < 8 && y >= 0 && y < 8
  end

  def new_move_positions(pos)
    results = []
    KnightPathFinder.valid_moves(pos).each do |new_pos|
    results<< new_pos unless @considered_positions.include?(new_pos)
    @considered_positions += results
    end
    results
  end

  def build_move_tree(start)
    q = [start]

    until q.empty?
      curr = q.shift
      new_move_positions(curr.value).each do |new_pos|
        new_node = PolyTreeNode.new(new_pos)
        curr.add_child(new_node)
        q << new_node
      end
    end
  end

  def trace_path_back(node)
    arr = []
    curr = node
    while curr != @root_node
   
      arr.unshift(curr)
      curr = curr.parent

    end
    arr.unshift(curr)
    arr
  end

  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node).map { |node| node.value }

  end


end

a=KnightPathFinder.new([0,0])
p a.find_path([7, 6])
p a.find_path([6, 2])

