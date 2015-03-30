require './tile'



class Board

  def initialize(length = 9, width = 9, mines=10)
    @length = length
    @width = width
    @mines = mines
    @tiles = create_tiles
  end

  attr_reader :length, :width, :mines, :tiles


  def create_tiles
    temp_board = Array.new(length) {Array.new width}
    tiles = []
    temp_board.each_with_index do |row, i|
      row.each_index do |j|
        tiles << Tile.new(self, [i,j])
      end
    end

    seed_bombs(tiles)
  end

  def seed_bombs(tiles)
    bombs = 0
    until bombs == @mines
      if tiles[rand(tiles.size - 1)].bomb == false
        tiles[rand(tiles.size - 1)].bomb = true
        bombs += 1
      end
    end

    tiles
  end

  def display
    arr = @tiles.each_slice(width).to_a
    arr.map do |row|
      row.map do |tile|
        tile.display
      end.join("..")
    end.join("\n\n")
  end

  def game_over?
    loser? || winner?
  end

  def loser?
    @tiles.each do |tile|
      if tile.revealed && tile.bomb
        puts "Game Over You lost!"
        return true
      end
    end
    false
  end
  def winner?
    @tiles.each do |tile|
      if !tile.bomb and !tile.revealed
        return false
      end
    end
    puts "CONGRATS B)"
    true
  end

  def set_mark(pos, flagged=false)

    spot = (pos[0]) * width + pos[1]
    tile = @tiles[spot]

    if tile.revealed
      nil
    #mark unrevealed tile as flagged
    elsif flagged && !tile.revealed
      tile.flagged = true
    #mark flagged tile as unflagged
    elsif tile.flagged && flagged
      tile.flagged = false
    elsif tile.determine == 0
      tile.revealed = true
      tile.neighbors.each do |child|
        set_mark(child.position)
      end
    else
      tile.revealed=true
    end
  end



end
