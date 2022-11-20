class Board
  attr_reader :board, :visual_board, :game_over
  
    def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false
    @visual_board =  "\n#{@board[0]} | #{@board[1]} | #{@board[2]} \n- * - * - \
    \n#{@board[3]} | #{@board[4]} | #{@board[5]}\n- * - * -\
    \n#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

  end

  class Player
    attr_reader :name, :letter, :player_arr

    def initialize(name, letter)
      @name = name
      @letter = letter
      @player_arr = []
    end

  end
  
  class Game
    attr_accessor :name, :letter, :visual_board, :board, :player1, :player2, :number_choosen, :index_choosen, :round_play, :change_player, :current_player,\
    :player_arr, :game_loop, :game_over

    WINNER_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    NUMBER_LIST = "123456789"

    @@booked_array = []
  
    def initialize
      @string_number_choosen = ""
      @index_arr = []
      @game_over = Board.new.game_over
      @current_player = nil
      @number_choosen = nil
      @board = Board.new.board
      @visual_board = Board.new.visual_board
      puts "\nHello player 1, What is your name?"
      @player1 = Player.new(gets.chomp, "X")
      puts "\nWelcome #{@player1.name}, you play with X"
      puts "\nHello player 2, What is your name?"
      @player2 = Player.new(gets.chomp, "O")
      puts "\nWelcome #{@player2.name}, you play with O"
      initial_player
    end

    def explain_game
      puts "Choose a number from the board to place your symbol. First to get 3 in a row wins!"
    end

    def initial_player
      @current_player = @player1
    end

    def change_player
      @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end

    def round_play
      puts "\n#{@current_player.name} it's your turn, pick a number from the board"
      pick_number
      @visual_board = @visual_board =  "\n#{@board[0]} | #{@board[1]} | #{@board[2]} \n- * - * - \
      \n#{@board[3]} | #{@board[4]} | #{@board[5]}\n- * - * -\
      \n#{@board[6]} | #{@board[7]} | #{@board[8]}"
      game_over
      is_draw
      change_player
    end

    def pick_number
      @string_number_choosen = gets.chomp
      if NUMBER_LIST.include?(@string_number_choosen)
        @number_choosen = @string_number_choosen.to_i
        @index_choosen = @number_choosen - 1
        @index_arr = @index_arr.push(@index_choosen)
        if (@index_arr - @@booked_array).empty?
          puts "That number is choosen! Pick another one"
          pick_number
        else
          @@booked_array.push(@index_choosen)
          place_symbol(@index_choosen)
          player_selection(@index_choosen)
        end
      else
        puts "Opss that's not a number, please choose a number available"
        pick_number
      end
    end

    def place_symbol(index)
      @board[index] = @current_player.letter
    end

    def player_selection(index)
      @current_player.player_arr.push(index)
    end

    def game_loop
      while @game_over == false do
        puts @visual_board
        round_play
      end
    end

    def game_over 
      WINNER_COMBINATIONS.map do |combination|
          if (combination - @current_player.player_arr).empty?
            puts @visual_board
            puts "\nCongratulations #{@current_player.name} you win!!"
            @game_over = true
        end
      end
    end

    def is_draw
      if @@booked_array.length == 9 && @game_over == false
        puts @visual_board
        puts "It's a draw"
        @game_over = true
      end
    end

    def convert_to_array
      new_winner_comb = WINNER_COMBINATIONS[0].split("")
      puts new_winner_comb.is_a?(Array)
      puts new_winner_comb
      puts
    end

  end
  
  def play_again
    puts "Would you like to play again? Press 'Y' for Yes or any other key to finish"
    play_again = gets.chomp
    play_again == "Y" ?  : "Thank you for playing"
  end

  new_board = Board.new
  new_game = Game.new
  new_game.game_loop

