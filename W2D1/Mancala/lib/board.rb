require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)

    @cups = Array.new(14) {[]}
    self.place_stones
    @cupsp1 = @cups[6]
    @cupsp2 = @cups[13]
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        cup.concat([:stone, :stone, :stone, :stone])
      end 
    end 
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    elsif start_pos == 6 || start_pos == 14
      raise "Can't start from a store"
    else
      true
    end
  end

  def make_move(start_pos, current_player_name)
    nextpos = (start_pos + 1 )% 13
    #@cups = @cups[7..12].reverse + @cups[13] + @cups[6] + @cups[0..5]
    until @cups[start_pos].empty?
      if current_player_name == @player1.name && nextpos == 13
        nextpos += 1 
      elsif current_player_name == @player2.name && nextpos == 6
        nextpos += 1 
      else
        
        @cups[nextpos] << @cups[start_pos].shift 
      end 
      nextpos += 1
    end

    self.render
    ending_cup_idx = (nextpos) % 13
    self.next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].length == 1 
      return :switch
    elsif (ending_cup_idx == 6 || ending_cup_idx == 13)
      return :prompt
    # else
    #   self.make_move(ending_cup_idx, current_player_name)    
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
      return true 
    end 
    false 
  end

  def winner
    if (@cups[6].length == @cups[13].length) #&& self.one_side_empty?#(@cups[0..5].all?(&:empty?) && @cups[7..12].all?(&:empty?))
      return :draw
    end 

    if (@cups[6].length > @cups[13].length)  #&& self.one_side_empty?#(@cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?))
      return "#{@player1.name}"
    elsif (@cups[6].length < @cups[13].length) #&& self.one_side_empty?#(@cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?))
      return "#{@player2.name}"
    end
  end 

end
