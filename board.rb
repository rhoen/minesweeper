class Board

  def initialize(length = 9, width = 9, mines = 10)
    @length = length
    @width = width
    @mines = mines
  end

  attr_reader :length, :width, :mines


  def determine

  end

  def seed
    temp_board = Array.new(length * width)
    while temp_board.count('*') < @mines
      temp_board[rand(0...temp_board.length)] = '*'
    end

    board = []
    length.times do |i|
      board << [temp_board.shift(width)]
    end

    board
  end

end
