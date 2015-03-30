class Board

  def initialize(length = 9, width = 9, mines=10)
    @length = length
    @width = width
    @mines = mines
    @tiles=[]

  end

  attr_reader :length, :width, :mines, :tiles




  def determine(seeded_board)

  end

  def seed
    temp_board = Array.new(length) {Array.new width}
    # while temp_board.count('*') < @mines
    #   temp_board[rand(0...temp_board.length)] = '*'
    # end
    #
    temp_board.each_with_index do |row, i|
      row.each_index do |j|
        @tiles= Tile.new(self, [i,j],)
      end
    end



  end

end
