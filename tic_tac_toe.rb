class Player
  attr_accessor :name, :char

  def initialize
    # @name
    # @char
  end

  def write_name(num)
    puts "Player #{num}, what is your name?"
    @name = gets.chomp
  end
  
  def write_char
    puts "#{@name}, what character would you like to use?"
    @char = gets.chomp.strip[0] # first character of input w/o whitespace
  end

  def make_move(space, board)
    @space = space
    @board = board

    check_move(@board.spaces_arr)

    @board.spaces_arr[@space - 1] = @char
    @board.update_board(@board.spaces_arr)
  end

  def check_char(p1_char)
    while @char == p1_char
      puts 'This character is already in use. Please pick a different one.'
      self.write_char
    end
  end

  def check_move(spaces)
    @spaces = spaces

    while !@space.between?(1, 9) || @board.spaces_arr[@space - 1].instance_of?(String)
      puts 'Invalid placement: Please enter a value between 1 and 9 and ensure that the space is free.'
      @space = gets.chomp.to_i
    end
  end
end

class Board
  attr_accessor :spaces_arr

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

  def check_for_win(players)
    p1 = players[0]
    p2 = players[1]

    winning_combos = [
      @spaces_arr.values_at(0, 1, 2),
      @spaces_arr.values_at(3, 4, 5),
      @spaces_arr.values_at(6, 7, 8),
      @spaces_arr.values_at(0, 3, 6),
      @spaces_arr.values_at(1, 4, 7),
      @spaces_arr.values_at(2, 5, 8),
      @spaces_arr.values_at(0, 4, 8),
      @spaces_arr.values_at(2, 4, 6)
    ]
    p winning_combos
    winning_combos.each do |val|
      p val
      if val.join("") == "#{p1.char}#{p1.char}#{p1.char}"
        end_game_by_win(p1)
      elsif val.join("") == "#{p2.char}#{p2.char}#{p2.char}"
        end_game_by_win(p2)
      end
    end
  end

  def end_game_by_win(player)
    puts "#{player.name} wins!"
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
player1.write_name(1)
player1.write_char

player2 = Player.new
player2.write_name(2)
player2.write_char
player2.check_char(player1.char)


board = Board.new(default_grid_spaces)
board.display_board

def play_game(player1, player2, board)
  round_count = 1

  while round_count <= 9
    if round_count.odd?
      puts "#{player1.name}, pick an available space to place your '#{player1.char}'"
      player1.make_move(gets.chomp.to_i, board)
    else
      puts "#{player2.name}, pick an available space to place your '#{player2.char}'"
      player2.make_move(gets.chomp.to_i, board)
    end
    board.display_board
    board.check_for_win([player1, player2])
    round_count += 1
  end
end

play_game(player1, player2, board)
