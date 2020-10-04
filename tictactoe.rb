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
end

test = Board.new
test.draw_board