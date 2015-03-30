require "tile"



class Board

  def initialize(length = 9, width = 9, mines=10)
    @length = length
    @width = width
    @mines = mines
    @tiles = create_tiles
    @tiles.seed_bombs

  end

  attr_reader :length, :width, :mines, :tiles


  def create_tiles
    temp_board = Array.new(length) {Array.new width}
    # while temp_board.count('*') < @mines
    #   temp_board[rand(0...temp_board.length)] = '*'
    # end
    #
    tiles = []
    temp_board.each_with_index do |row, i|
      row.each_index do |j|
        tiles << Tile.new(self, [i,j],)
      end
    end

    tiles
  end

  def seed_bombs

    bombs = 0
    until bombs = @mines
      if @tiles[rand(@tiles.size - 1)].bomb == false
        @tiles[rand(@tiles.size - 1)].bomb = true
        bombs += 1
      end
    end

  end

  def display
    @tiles.map do |row|
      row.map do |tile|
        tile.display
      end.join("")
    end.join("\n")
  end

end
