  class LRUCache
    def initialize(num)
        @cache = Array.new()
        @capacity = num
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @cache.count < @capacity
            if @cache.include?(el)
                @cache.push(@cache.delete_at(@cache.index(el)))
            else
                @cache.unshift(el)
            end 
        else 
            if @cache.include?(el)
                @cache.push(@cache.delete_at(@cache.index(el)))
            else
                @cache.shift 
                @cache.push(el)
            end
        end 


        # if @cache.include?(el) && @cache.count == 4
        #    @cache.unshift(@cache.delete_at(@cache.index(el)))
        # else
        #     @cache.pop
        #     @cache.unshift(el)
        # end
    end

    def show
      # shows the items in the cache, with the LRU item first
        puts "#{@cache}"
    end

    private
    # helper methods go here!
    attr_reader :cache, :capacity
  end

if __FILE__ == $PROGRAM_NAME
    johnny_cache = LRUCache.new(4)

    johnny_cache.add("I walk the line")
    johnny_cache.add(5)

    johnny_cache.count # => returns 2

    johnny_cache.add([1,2,3])
    johnny_cache.add(5)
    johnny_cache.add(-5)
    johnny_cache.add({a: 1, b: 2, c: 3})
    johnny_cache.add([1,2,3,4])
    johnny_cache.add("I walk the line")
    johnny_cache.add(:ring_of_fire)
    johnny_cache.add("I walk the line")
    johnny_cache.add({a: 1, b: 2, c: 3})


    johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end  