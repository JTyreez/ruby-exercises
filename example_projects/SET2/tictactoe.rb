# Method to display the current state of the board.
def display_board(board)
    puts "  0 1 2"
    board.each_with_index do |row, idx|
      puts "#{idx} #{row.join('|')}"
      puts '  -----'
    end
  end
  
  # Method to check if the chosen cell is empty.
  def valid_move?(board, row, col)
    board[row][col] == ' '
  end
  
  # Method for X to make their move.
  def player_x_move(board)
    puts "Player X's turn (row, col):"
    row, col = gets.chomp.split(',').map(&:to_i)
    if valid_move?(board, row, col)
      board[row][col] = 'X'
    else
      puts "Invalid move. Try again."
      player_x_move(board)
    end
  end
  
  # Method for O to make their move.
  def player_o_move(board)
    puts "Player O's turn (row, col):"
    row, col = gets.chomp.split(',').map(&:to_i)
    if valid_move?(board, row, col)
      board[row][col] = 'O'
    else
      puts "Invalid move. Try again."
      player_o_move(board)
    end
  end
  
  # Method to check if any player has won the game.
  def check_win(board)
    # Check rows for a win
    board.each do |row|
      return true if row.uniq.length == 1 && row[0] != ' '
    end
  
    # Check columns for a win
    board.transpose.each do |col|
      return true if col.uniq.length == 1 && col[0] != ' '
    end
  
    # Check diagonals for a win
    return true if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != ' '
    return true if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != ' '
  
    false
  end
  
  # Method to check if the game ended in a draw.
  def check_draw(board)
    board.flatten.none?(' ')
  end
  
  # Method to start the main game loop.
  def play_game
    board = Array.new(3) { Array.new(3, ' ') }
    current_player = 'X'
    game_over = false
    total_moves = 0
  
    until game_over
      display_board(board)
  
      if current_player == 'X'
        player_x_move(board)
      else
        player_o_move(board)
      end
  
      total_moves += 1
  
      if check_win(board)
        display_board(board)
        puts "Player #{current_player} wins!"
        game_over = true
      elsif total_moves == 9 # All cells filled, no winner
        display_board(board)
        puts "Game ended in a draw."
        game_over = true
      end
  
      current_player = (current_player == 'X') ? 'O' : 'X'
    end
  end


  # Start the game
  puts "Welcome to Tic Tac Toe!"
  play_game

