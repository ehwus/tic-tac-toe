# frozen_string_literal: true

# OBJECTS
# game board
# contains all logic for a game of tic-tac-toe
class Board
  attr_reader :current_player, :player1_name, :player2_name

  def initialize
    # var for each cell
    # ' ' indicates blank
    # else X or O
    @spaces =
      [' ', ' ', ' ',
       ' ', ' ', ' ',
       ' ', ' ', ' ']
  end

  def get_player_names
    puts 'Player 1 - Enter your name'
    @player1_name = gets.chomp
    puts 'Player 2 - Enter your name'
    @player2_name = gets.chomp
    # randomly choose a player and announce
    @current_player = [1, 2].sample
    puts @current_player == 1 ? "#{@player1_name} picked at random to begin" : "#{@player2_name} picked at random to begin"
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

    @spaces[cell] = if @current_player == 1
                      'O'
                    else
                      'X'
                    end
  end

  # check for winner
  # return 'x' or 'o' if there is one
  # else nothing
  def check_for_winner
    # stub
    @winner = 'stub'
    false
  end
  
  def declare_winner
    "It's a draw" if @winner == 'draw'
    "#{@winner} wins!"
  end
end

# MAIN
# VARIABLES
game = Board.new
# decide who will play first
game.get_player_names
# main game loop
loop do
  # draw board and announce player turn
  game.draw_board
  puts game.current_player == 1 ? "#{game.player1_name}'s move - pick a square (0-8)" : "#{game.player2_name}'s move - pick a square (0-8)"
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

  current_player = if current_player == 1
                     2
                   else
                     1
                   end
end

puts game.declare_winner
