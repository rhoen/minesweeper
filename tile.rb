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




end
