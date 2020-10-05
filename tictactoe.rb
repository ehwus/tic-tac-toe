# frozen_string_literal: true

# OBJECTS
# game board
# contains all logic for a game of tic-tac-toe
class Board
  attr_reader :current_player, :x_player_name, :o_player_name

  def initialize
    # var for each cell
    # ' ' indicates blank
    # else X or O
    @spaces =
      [' ', ' ', ' ',
       ' ', ' ', ' ',
       ' ', ' ', ' ']

    @current_player = 'O'
  end

  def take_player_names
    puts 'Player 1 - Enter your name'
    player1_name = gets.chomp
    puts 'Player 2 - Enter your name'
    player2_name = gets.chomp
    # randomly choose a player and announce
    @x_player = [1, 2].sample
    if @x_player == 1
      @x_player_name = player1_name
      @o_player_name = player2_name
    else
      @x_player_name = player2_name
      @o_player_name = player1_name
    end
    puts "#{@x_player_name} picked to start"
  end

  # puts each row of board
  # to update players
  def draw_board
    (0..8).each do |i|
      puts if (i % 3).zero? && i != 0
      print '|'
      print @spaces[i]
      print '|'
    end
    puts
  end

  # if legal, update cell to be player
  # if not, return invalid
  def update_board(cell)
    raise 'Space already occupied' if @spaces[cell] != ' '

    @spaces[cell] = if @current_player == 'X'
                      'X'
                    else
                      'O'
                    end
  end

  # change the player over
  def next_player
    @current_player = if @current_player == 'X'
      'O'
    else
      'X'
    end
  end

  # helper function for check_for winner
  # takes 3 cells and returns 'X' if all are X
  # same for O, and 'false' if neither
  def check_three(cell1, cell2, cell3)
    together = [cell1, cell2, cell3]
    return 'X' if together.all? { |cell| cell == 'X' }

    return 'O' if together.all? { |cell| cell == 'O' }

    false
  end

  # check for winner
  # return 'x' or 'o' if there is one
  # else nothing
  def check_for_winner
    # check each condition for winning
    first_row = check_three(@spaces[0], @spaces[1], @spaces[2])
    if first_row
      @winner = first_row
      return true
    end

    second_row = check_three(@spaces[3], @spaces[4], @spaces[5])
    if second_row
      @winner = second_row
      return true
    end

    third_row = check_three(@spaces[6], @spaces[7], @spaces[8])
    if third_row
      @winner = third_row
      return true
    end

    diagonal1 = check_three(@spaces[0], @spaces[4], @spaces[8])
    if diagonal1
      @winner = diagonal1
      return true
    end

    diagonal2 = check_three(@spaces[2], @spaces[4], @spaces[6])
    if diagonal2
      @winner = diagonal2
      return true
    end

    false
  end

  def declare_winner
    "It's a draw" if @winner == 'draw'
    "#{@x_player_name} wins!" if @winner == 'X'
    "#{@o_player_name} wins!"
  end
end

# MAIN
# VARIABLES
game = Board.new
# decide who will play first
game.take_player_names
# main game loop
loop do
  # draw board and announce player turn
  game.draw_board
  puts game.current_player == 'O' ? "#{game.o_player_name}'s move - pick a square (0-8)" : "#{game.x_player_name}'s move - pick a square (0-8)"
  # take choice and update
  # will catch error
  begin
    choice = gets.chomp.to_i
    game.update_board(choice)
  rescue
    puts 'Space in use - please make another choice'
    retry
  end

  break if game.check_for_winner

  game.next_player
end
game.draw_board
puts game.declare_winner
