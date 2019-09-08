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
        self.children << child unless self.children.include?(child)
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