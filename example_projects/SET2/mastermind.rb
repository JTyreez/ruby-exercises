# Generate secret code, define available colors, set max attempts
# Prompt user to input guess, validate input
# Evaluate guess, indicate number of correct numbers
# Loop, win/lose conditions, timer
# Error handling

def generate_secret_code(colors, code_length)
    secret_code = []
    code_length.times { secret_code << colors.sample }
    secret_code
  end
  
  def valid_guess?(guess, colors, code_length)
    guess.length == code_length && guess.all? { |color| colors.include?(color) }
  end
  
  def evaluate_guess(secret_code, guess)
    correct_colors = 0
    correct_positions = 0
  
    secret_code.each_with_index do |color, index|
      if color == guess[index]
        correct_positions += 1
      elsif secret_code.include?(guess[index])
        correct_colors += 1
      end
    end
  
    [correct_colors, correct_positions]
  end
  
  def display_colors(colors)
    puts "Available colors: #{colors.join(', ')}"
  end
  
  def play_game
    colors = ['red', 'green', 'blue', 'yellow', 'orange', 'purple']
    code_length = 4
    max_attempts = 12
  
    secret_code = generate_secret_code(colors, code_length)
  
    puts "Welcome to Mastermind!"
    puts "Try to guess the secret code consisting of #{code_length} colors."
  
    display_colors(colors)
  
    attempts = 0
  
    loop do
      attempts += 1
      puts "\nAttempt #{attempts}: Enter your guess (separated by spaces):"
      guess = gets.chomp.downcase.split
  
      if guess == ['q']
        puts "Thanks for playing!"
        break
      end
  
      if valid_guess?(guess, colors, code_length)
        guess_result = evaluate_guess(secret_code, guess)
        correct_colors, correct_positions = guess_result
  
        if correct_positions == code_length
          puts "Congratulations! You guessed the secret code #{secret_code.join(', ')}!"
          break
        else
          puts "Correct colors: #{correct_colors}, Correct positions: #{correct_positions}"
        end
  
        if attempts == max_attempts
          puts "Sorry, you've reached the maximum number of attempts."
          puts "The secret code was #{secret_code.join(', ')}. Better luck next time!"
          break
        end
      else
        puts "Invalid guess. Make sure to use valid colors and the correct number of colors."
        display_colors(colors)
      end
    end
  end
  
  play_game