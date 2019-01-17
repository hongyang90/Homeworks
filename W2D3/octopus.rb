def sluggish_octopus(arr)
    bigfish = ""
    arr.each do |fish1|
        arr.each do |fish2|
            if fish1.length > fish2.length
                bigfish = fish1
            else
                bigfish = fish2
            end
        end 
    end 
    bigfish
end

def dominant_octopus(arr)
    return arr if arr.length <= 1
    pivot = arr.first 
    left = arr[1...mid].select {|ele| ele.length < pivot.length }
    right = arr[mid..-1].select {|ele| ele.length >= pivot.length }
    result = dominantOctopus(left) + [pivot] + dominantOctopus(right)
    result.last 
end

def clever_octopus(arr)
    bigfish = ""
    arr.each do |fish|
        if fish.length > bigfish.length
            bigfish = fish
        end 
    end 
    bigfish
end

def slow_dance(direction, tiles)
    tiles.each_with_index do |tile, i|
        return i if direction == tile 
    end 
end

def fast_dance(direction, tiles)
    tiles[direction] # assumes tiles is a hash of direction as keys and legs as values
end