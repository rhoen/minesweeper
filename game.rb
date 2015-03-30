require './board'
require 'yaml'

class Game

  DIFFICULTIES = { easy: [9,9,10], medium: [16,16,40], hard: [30,16,99]  }


  def initialize(difficulty = :easy)
    @board = Board.new(*DIFFICULTIES[difficulty])
  end

  def load(board)
    @board = board
  end

  def play
    until @board.game_over?
      puts "Enter move i.e. [x, y], flag? (e.g. 1,4,true sets a flag on [1,4].
      1,4 reveals [1,4]) or type \"save\""
      move = gets.chomp
      if move == 'save'
        save_game
        return
      end
      @board.set_mark(*parse_input(move))
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

  def save_game
    f = File.open('saved_game.txt', 'w')
    f.puts @board.to_yaml
    f.close
  end

end


if __FILE__ == $PROGRAM_NAME
  if ARGV[0]
    game = Game.new.load(ARGV[0])
  else
    puts "choose difficulty: easy, meduim, hard"
    choice = gets.chomp
    case choice
    when "easy"
      game = Game.new(:easy)
    when "medium"
      game = Game.new(:medium)
    when "hard"
      game = Game.new(:hard)
    end
  end
  game.play
end
