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
end

test = Board.new
test.update_board(0, 0, 'X')
test.draw_board
test.update_board(1, 1, 'O')
puts
test.draw_board
