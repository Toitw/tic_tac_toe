class Board
  attr_reader :board, :visual_board, :game_over
  
    def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false
    @visual_board =  "#{@board[0]} | #{@board[1]} | #{@board[2]} \n- * - * - \
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
  
    def initialize
      @game_over = Board.new.game_over
      @current_player = nil
      @number_choosen = nil
      @board = Board.new.board
      @visual_board = Board.new.visual_board
      puts "Hello player 1, What is your name?"
      @player1 = Player.new(gets.chomp, "X")
      puts "Welcome #{@player1.name}, you play with X"
      puts "Hello player 2, What is your name?"
      @player2 = Player.new(gets.chomp, "O")
      puts "Welcome #{@player2.name}, you play with O"
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
      puts @visual_board
      puts "#{@current_player.name} it's your turn, pick a number from the board"
      @number_choosen = gets.chomp.to_i
      @index_choosen = @number_choosen - 1
      place_symbol(@index_choosen)
      player_selection(@index_choosen)
      @visual_board = @visual_board =  "#{@board[0]} | #{@board[1]} | #{@board[2]} \n- * - * - \
      \n#{@board[3]} | #{@board[4]} | #{@board[5]}\n- * - * -\
      \n#{@board[6]} | #{@board[7]} | #{@board[8]}"
      game_over
      change_player
    end

    def place_symbol(index)
      @board[index] = @current_player.letter
    end

    def player_selection(index)
      @current_player.player_arr.push(index)
    end

    def game_loop
      while @game_over == false do
        round_play
      end
    end

    def game_over 
      WINNER_COMBINATIONS.map do |combination|
        p combination
        p @current_player.player_arr
          if (combination - @current_player.player_arr).empty?
            puts "Congratulations #{@current_player.name} you win!!"
            @game_over = true
        end
      end
    end

    def convert_to_array
      new_winner_comb = WINNER_COMBINATIONS[0].split("")
      puts new_winner_comb.is_a?(Array)
      puts new_winner_comb
      puts
    end
  end
  
  new_board = Board.new
  new_game = Game.new
  new_game.game_loop