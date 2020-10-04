# OBJECTS
# game board
class Board
  def initialize
    # var for each cell
    # ' ' indicates blank
    # else X or O
    @spaces =
      [[' ', ' ', ' '],
       [' ', ' ', ' '],
       [' ', ' ', ' ']]
  end

  # puts each row of board
  # to update players
  def draw_board
    @spaces.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
    end
  end

  # if legal, update cell to be player
  # if not, return invalid
  def update_board(x, y, player)
    return 'invalid' if @spaces[x][y] != ' '

    @spaces[x][y] = player
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
puts "Player 1 - Enter your name"
player1_name = gets.chomp
puts "Player 2 - Enter your name"
player2_name = gets.chomp
# randomly choose 1 or two
current_player = [1, 2].sample
puts current_player == 1 ? "#{player1_name} picked at random to begin" : "#{player2_name} picked at random to begin"
game.draw_board
