class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index,character)
    @board[index] = character
  end

  def position_taken?(index)
    !@board[index].nil? || @board[index] == " "
  end

  def valid_move?(index)
    if (index.between?(0,8) && position_taken?(index) == false)
      return true
    end
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if !(index.nil? || index == " ")
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else turn
  end
end


def won?
  WIN_COMBINATIONS.each {|win_combo|
    index1 = win_combo[0]
    index2 = win_combo[1]
    index3 = win_combo[3]

    position1 = @board[index1]
    position2 = @board[index2]
    position3 = @board[index3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return win_combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return win_combo
    end
  }
  return false
end



def full?
  return_value = true
  @board.each do |index|
    if (index.nil? || index == " ")
      return_value false
    end
  end
  return return_value
end


def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end


  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
        puts "Congratulations #{winner}!"
    end
  end
end

