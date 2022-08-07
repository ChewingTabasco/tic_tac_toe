class Player
  attr_accessor :name, :char

  def initialize
    @name
    @char
  end

  def set_attributes(num)
    puts "Player #{num}, what is your name?"
    self.name = gets.chomp

    puts "#{self.name}, what character would you like to use?"
    self.char = gets.chomp
  end
end

class Board
  def initialize(array)
    # @top = top
    # @middle = middle
    # @bottom = bottom
    # @bar = bar
    @array = array
  end

  def display_board
    # puts @top.join("")
    # puts @bar.join("")
    # puts @middle.join("")
    # puts @bar.join("")
    # puts @bottom.join("")

    puts @array
  end
end

# one = [" ", 1, " ", "|"," ", 2, " ", "|", " ", 3, " "]
# two = [" ", 4, " ", "|"," ", 5, " ", "|", " ", 6, " "]
# three = [" ", 7, " ", "|"," ", 8, " ", "|", " ", 9, " "]
# bars = ["---+---+---"]

default_board_strings = [
  "     |     |     ", 
  "  1  |  2  |  3  ", 
  "_____|_____|_____", 
  "     |     |     ", 
  "  4  |  5  |  6  ", 
  "_____|_____|_____", 
  "     |     |     ", 
  "  7  |  8  |  9  ", 
  "     |     |     "]

# player1 = Player.new()
# player1.set_attributes(1)

# player2 = Player.new()
# player2.set_attributes(2)

# board = Board.new(one, two, three, bars)
board = Board.new(board_strings)
board.display_board

# my_strings = board_strings
# board_strings.each do |el|
#   if el.include?("2")
#     my_strings[1] = my_strings[1].sub("2", "x")
#   end
# end
# board = Board.new(my_strings)
# board.display_board
