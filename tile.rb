class Tile
  def initialize(board,position)
    @flagged = false
    @bomb = false
    @revealed = false
    @position= position
    @board=board #object
  end

  RELATIVE_POSITIONS= [[-1,-1],[-1,0],[-1,1],
                        [0,-1],       [0,1],
                        [1,-1],[1,0],[1,1]]



  def determine
    near_tiles=[]
    RELATIVE_POSITIONS.each do |(row,column)|
      @board.tiles.each do |tile|
        near_tiles << tile if tile.position == [(@position[0]+ row) , (@position[1] + column)]
      end
    end

    bombs = 0
    near_tiles.each do |tile|
      bombs += 1 if tile.bomb
    end

    bombs
  end


end
