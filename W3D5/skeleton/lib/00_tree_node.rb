class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # node
    # /  \
    #self >> [rest of children]
    def parent=(node)
        if self.parent
            self.parent.children.delete(self)
        end
        @parent = node
        node.children << self unless node == nil || node.children.include?(self)
    end

    def add_child(child)
        child.parent = self
        # self.children << child unless self.children.include?(child)
    end

    def remove_child(child)
        child.parent = nil
        raise if !self.children.include?(child)
        self.children.delete(child)
    end

    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        return nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            curr = queue.shift
            return curr if curr.value == target_value
            curr.children.each { |child| queue << child }
        end
        nil
    end
end

# class Searchable
#     def initialize(node)
#         @parent = node
#     end
#     def dfs(target_value)
#     end
# end

# Memory
# 1af:PolyTreeNode
#    @value -> 10
#    @parent -> :bce
#    @children -> [:678]
# a6b:PolyTreeNode
#    @value -> 15
#    @parent -> nil
#    @children -> []
# bce:PolyTreeNode
#    @value -> 12
#    @parent -> nil
#    @children -> [:1af]
# 678:PolyTreeNode
#    @value -> 3
#    @parent -> nil
#    @children -> []

# Symbol table
# PolyTreeNode -> class ...
# n -> :1af
# # Symbol table: add_child
# # self -> n
# # child -> :678

# n = PolyTreeNode.new(10) # id:1af
# n.parent = PolyTreeNode.new(15) # id:a6b
# n.parent = PolyTreeNode.new(12) # id:bce
# n.add_child(PolyTreeNode.new(3)) # id:678
