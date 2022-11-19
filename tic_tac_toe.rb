class Board
  attr_reader :board, :visual_board, :game_over
  
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
  
    def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false 
    @visual_board =  "#{@board[0]} | #{@board[1]} | #{@board[2]} \n- * - * - \
    \n#{@board[3]} | #{@board[4]} | #{@board[5]}\n- * - * -\
    \n#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

  end

  class Player
    attr_reader :name, :letter

    def initialize(name, letter)
      @name = name
      @letter = letter
    end

  end
  
  class Game
    attr_accessor :name, :letter, :visual_board, :board, :player1, :player2, :number_choosen, :index_choosen, :round_play, :change_player, :current_player,\
    :player_selection
  
    def initialize
      @player_selection = []
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
      puts @player_selection
      change_player
    end

    def place_symbol(index)
      @board[index] = @current_player.letter
    end

    def player_selection(index)
      @player_selection.push(index)
    end

    def game_over 
    end
  end
  
  new_board = Board.new
  new_game = Game.new
  new_game.round_play