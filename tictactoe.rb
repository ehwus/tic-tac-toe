# OBJECTS
# game board
class Board
  def initialize
    # var for each cell
    # ' ' indicates blank
    # else X or O
    @spaces =
      [' ', ' ', ' ',
       ' ', ' ', ' ',
       ' ', ' ', ' ']
  end

  # puts each row of board
  # to update players
  def draw_board
    (0..8).each do |i|
      puts if i % 3 == 0 && i != 0
      print ' '
      print @spaces[i]
      print ' '
      print '|'
    end
    puts
  end

  # if legal, update cell to be player
  # if not, return invalid
  def update_board(cell, player)
    return 'invalid' if @spaces[cell] != ' '

    @spaces[cell] = player
  end

  # check for winner
  # return 'x' or 'o' if there is one
  # else nothing
  def check_for_winner
    # stub
    false
  end
end

game = Board.new
# decide who will play first
puts 'Player 1 - Enter your name'
player1_name = gets.chomp
puts 'Player 2 - Enter your name'
player2_name = gets.chomp
# randomly choose a player and announce
current_player = [1, 2].sample
puts current_player == 1 ? "#{player1_name} picked at random to begin" : "#{player2_name} picked at random to begin"
# main game loop
loop do
  game.draw_board
  puts current_player == 1 ? "#{player1_name}'s move - pick a square (0-9)" : "#{player2_name}'s move - pick a square (0-9)"
  choice = gets.chomp.to_i
  game.update_board(choice, current_player)
  break if game.check_for_winner
end
