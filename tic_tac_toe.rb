class Player
  attr_accessor :name, :char

  def initialize
    # @name
    # @char
  end

  def write_attributes(num)
    puts "Player #{num}, what is your name?"
    @name = gets.chomp

    puts "#{@name}, what character would you like to use?"
    @char = gets.chomp.strip[0] # first character of input w/o whitespace
  end

  def make_move(space, board)
    @space = space
    @board = board

    @board.spaces_arr[space - 1] = @char
    @board.update_board(@board.spaces_arr)

    # puts "grid number #{@space} should be #{@char}"
  end
end

class Board
  attr_accessor :board_arr, :spaces_arr

  def initialize(spaces_arr)
    @spaces_arr = spaces_arr
    @board_arr = [
  "     |     |     ",
  "  #{spaces_arr[0]}  |  #{spaces_arr[1]}  |  #{spaces_arr[2]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{spaces_arr[3]}  |  #{spaces_arr[4]}  |  #{spaces_arr[5]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{spaces_arr[6]}  |  #{spaces_arr[7]}  |  #{spaces_arr[8]}  ",
  "     |     |     "]
  end

  def display_board
    puts @board_arr
  end

  def update_board(new_spaces_arr)
    @spaces_arr = new_spaces_arr
    @board_arr  = [
  "     |     |     ",
  "  #{spaces_arr[0]}  |  #{spaces_arr[1]}  |  #{spaces_arr[2]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{spaces_arr[3]}  |  #{spaces_arr[4]}  |  #{spaces_arr[5]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{spaces_arr[6]}  |  #{spaces_arr[7]}  |  #{spaces_arr[8]}  ",
  "     |     |     "]
  end
end

default_grid_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]

default_board_strings = [
  "     |     |     ",
  "  #{default_grid_spaces[0]}  |  #{default_grid_spaces[1]}  |  #{default_grid_spaces[2]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{default_grid_spaces[3]}  |  #{default_grid_spaces[4]}  |  #{default_grid_spaces[5]}  ",
  "_____|_____|_____",
  "     |     |     ",
  "  #{default_grid_spaces[6]}  |  #{default_grid_spaces[7]}  |  #{default_grid_spaces[8]}  ",
  "     |     |     "]

player1 = Player.new
player1.write_attributes(1)

player2 = Player.new
player2.write_attributes(2)

board = Board.new(default_grid_spaces)
board.display_board

4.times do
  puts 'player 1 move?'
  player1.make_move(gets.chomp.to_i, board)
  board.display_board

  puts 'player 2 move?'
  player2.make_move(gets.chomp.to_i, board)
  board.display_board
end
