class Game

  DIFFICULTIES{ easy: [9,9,10], medium: [16,16,40], hard:[30,16,99]  }


  initialize(difficulty=:easy)
    @board = Board.new(*DIFFICULTES[difficulty])
  end

  def play
    @board.seed_bombs
  end



end
