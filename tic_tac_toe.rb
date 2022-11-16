

=begin class Player
  attr_accessor :name, :letter

  def get_name
    @name = gets.chomp
  end

  def get_letter
    @letter = gets.chomp.upcase
  end
end

class Game
  attr_accessor :board_arr, :num_selection

  def initialize
    @board_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    puts "Let's the game begin!"
    puts "#{@board_arr[0]} | #{@board_arr[1]} | #{@board_arr[2]} \n- * - * - \
    \n#{@board_arr[3]} | #{@board_arr[4]} | #{@board_arr[5]}\n- * - * -\
    \n#{@board_arr[6]} | #{@board_arr[7]} | #{@board_arr[8]}" 
  end

  def round_start
    puts "Choose a number"
    @num_selection = gets.chomp
    mark_selection
  end

  def mark_selection
    p player1.letter
    p @num_selection
    @new_board = @board_arr.map {|x| x == @num_selection ? player1.letter : x}
    p @new_board
  end

end

    puts "Hello player 1, What's your name?"
    player1 = Player.new
    player1.get_name
    puts "Welcome #{player1.name} "
    puts 'Now choose a letter, normally either X or O'
    player1.get_letter
    puts "Your letter is #{player1.letter}"
    puts "Hello player 2, What's your name?"
    player2 = Player.new
    player2.get_name
    puts "Welcome #{player2.name}"
    puts "Now choose a letter, except #{player1.letter}"
    player2.get_letter
    puts "Your letter is #{player2.letter}"

    new_game = Game.new
    new_game.round_start
=end
 
class Game
  attr_accessor :name, :letter, :count, :board, :num_selection

  WINNER_COMBINATIONS = %w[
    012
    345
    678
    036
    147
    258
    048
    642
  ]

  @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@visual_board = "#{@@board[0]} | #{@@board[1]} | #{@@board[2]} \n- * - * - \
  \n#{@@board[3]} | #{@@board[4]} | #{@@board[5]}\n- * - * -\
  \n#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
  @@count = 0
  
end

class Player < Game

  def initialize(name="Unknown", letter="Unknown")
    @@count += 1

    if @@count == 1
      puts "Hello player#{@@count}, write down your name"
      @name = gets.chomp
      puts "Now choose a letter to play"
      @letter = gets.chomp.upcase
    else
      puts "Hello player#{@@count}, write down your name"
      @name = gets.chomp
      puts "Now choose a letter to play (except #{letter})"
      @letter = gets.chomp.upcase
    end
  end

  def play_round(num_selection=(0))
    puts "\n#{@@visual_board}\n#{@name}, choose a number on the board to place #{@letter}"
    @num_selection = gets.chomp.to_i - 1
    @@board[@num_selection] = @letter
  end

  def letter_location
    @player_arr = []
    @@board.each_index do |index| 
      @@board[index] == @letter ? @player_arr.push(index) : "Error"
    end
  end

  def has_won
    
  end
end

player1 = Player.new
player1_letter = player1.letter
player2 = Player.new("unknown", player1_letter)
player1.play_round
player1.letter_location