class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue.last
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value] if @map.nil?
        if @map.any? {|pair| pair[0] == key }
            @map.each_with_index do |pair, i| 
                if pair[0] == key 
                    @map[i] = [key, value]
                end 
            end 
        else 
            @map << [key, value]
        end 
    end

    def get(key)
        @map.each_with_index do |pair, i|
            return pair[1] if pair[0] == key
        end 
    end

    def delete(key)
        
        @map.each_with_index do |pair, i|
            @map.delete_at(i) if pair[0] == key 
            break 
        end 
    end

    def show
        #not sure what this method is asking for, assuming show first element like peek
        @map.first
    end
end