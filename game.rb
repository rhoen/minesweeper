require './board'


class Game

  DIFFICULTIES = { easy: [9,9,10], medium: [16,16,40], hard: [30,16,99]  }


  def initialize(difficulty = :easy)
    @board = Board.new(*DIFFICULTIES[difficulty])
  end

  def play
    until @board.game_over?
      puts "Enter move i.e. [x, y], flag? (e.g. 1,4,true sets a flag on [1,4].
      1,4 reveals [1,4])"
      move = gets.chomp
      @board.set_mark(parse_input(move))
      render
    end
  end

  def parse_input(input)
    input = input.split(',')
    pos = []
    pos << input[0].to_i
    pos << input[1].to_i
    flagged = !input[2].nil?
    [pos, flagged]
  end

  def render
    puts @board.display
  end

end
