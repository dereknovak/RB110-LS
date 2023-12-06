require 'pry'
require 'yaml'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
MESSAGES = YAML.load_file('tictactoe_messages.yml')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CURRENT_PLAYER = %w(Player Computer)

def clear_screen
  system('clear') || system('cls')
end

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_message(message)
  puts "=> #{MESSAGES[message]}"
end

def puts_message(message)
  puts MESSAGES[message]
end

def joinor(arr, separator = ',', preposition = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{preposition} ")
  else
    arr[-1] = "#{preposition} #{arr.last}"
    arr.join("#{separator} ")
  end
end

# Display Methods

def display_round_info(total_rounds, round, difficulty, wins)
  puts " ====== BEST OF #{total_rounds} ======"
  puts difficulty.to_s.center(24)
  puts "         ROUND #{round}"
  puts " Player: #{wins[:Player]} | Computer: #{wins[:Computer]}"
  puts ''
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, total_rounds, round, difficulty, wins)
  clear_screen
  display_round_info(total_rounds, round, difficulty, wins)
  puts "        |     |"
  puts "     #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "     #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "     #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "        |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_grand_champion(champion, total_rounds, round, difficulty, wins)
  round -= 1
  clear_screen
  display_round_info(total_rounds, round, difficulty, wins)
  case champion
  when 'Player' then puts_message('player_champion')
  when 'Computer' then puts_message('computer_champion')
  end
end

def display_instructions
  clear_screen
  puts_message('instructions')
  continue_program
end

# User Input Methods

def continue_program
  prompt_message('continue?')
  gets.chomp
end

def choose_directory
  valid_choices = %w(1 2 3)

  loop do
    choice = gets.chomp
    return choice if valid_choices.include?(choice)
    prompt_message('valid_choice')
  end
end

def set_difficulty
  prompt_message('difficulty')

  loop do
    difficulty = gets.chomp[0]

    case difficulty
    when 'b' then return 'Beginner'
    when 'm' then return 'Medium'
    when 'h' then return 'Hard'
    when 'e' then return 'Expert'
    else     prompt_message('valid_diff')
    end
  end
end

def indicate_total_rounds
  prompt_message("rounds?")

  loop do
    rounds = gets.chomp.to_f
    if rounds % 1 != 0
      prompt_message('valid_integer')
    elsif rounds > 9
      prompt_message('too_many')
    elsif rounds.to_i.odd? && rounds > 0
      return rounds.to_i
    else
      prompt_message('odd_integer')
    end
  end
end

def determine_starting_player
  prompt_message('turn')
  loop do
    turn = gets.chomp.downcase[0]
    case turn
    when 'p' then return CURRENT_PLAYER.first
    when 'c' then return CURRENT_PLAYER.last
    when 'r' then return CURRENT_PLAYER.sample
    else     prompt_message('valid_turn')
    end
  end
end

def play_again?
  prompt_message('again?')
  yes_or_no
end

def yes_or_no
  loop do
    choice = gets.chomp.downcase
    return 'y' if choice.start_with?('y')
    return 'n' if choice.start_with?('n')
    prompt_message('yes_or_no')
  end
end

# Gameplay Methods

def place_piece!(brd, current_player, difficulty)
  square = nil
  case current_player
  when 'Player' then player_place_piece!(brd, square)
  when 'Computer' then computer_place_piece!(brd, square, difficulty)
  end
end

def player_place_piece!(brd, square)
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt_message('valid_square')
  end

  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
def computer_place_piece!(brd, square, difficulty)
  if difficulty == 'Expert' || difficulty == 'Hard'
    square ||= offensive_mode(brd, square)
  end

  if difficulty == 'Expert' || difficulty == 'Hard' || difficulty == 'Medium'
    square ||= defensive_mode(brd, square)
  end

  square ||= 5 if difficulty == 'Expert' && brd[5] == INITIAL_MARKER
  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity

def offensive_mode(brd, square)
  WINNING_LINES.each do |line|
    square = find_winning_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  square
end

def defensive_mode(brd, square)
  WINNING_LINES.each do |line|
    square ||= find_winning_square(line, brd, PLAYER_MARKER)
    break if square
  end

  square
end

def alternate_player(current_player)
  case current_player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

# Score Methods

def reset_score(wins)
  wins[:Player] = 0
  wins[:Computer] = 0
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def increment_score(wins, winner)
  case winner
  when 'Player'
    wins[:Player] += 1
  when 'Computer'
    wins[:Computer] += 1
  end
end

def determine_champion(wins)
  wins[:Player] > wins[:Computer] ? 'Player' : 'Computer'
end

# Board Methods

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def find_winning_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

# Main Game Method

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
def play_tictactoe(wins)
  clear_screen

  # New Game Setup
  puts_message('setup')
  difficulty = set_difficulty
  total_rounds = indicate_total_rounds
  starting_player = determine_starting_player
  current_player = starting_player

  loop do
    # Rematch Setup
    round = 1
    reset_score(wins)
    current_player = starting_player

    # Main Game Begins
    until total_rounds / 2 < wins[:Player] || total_rounds / 2 < wins[:Computer]
      board = initialize_board

      loop do
        display_board(board, total_rounds, round, difficulty, wins)
        puts_message('thinking') || sleep(1.2) if current_player == 'Computer'
        place_piece!(board, current_player, difficulty)
        current_player = alternate_player(current_player)
        break if someone_won?(board) || board_full?(board)
      end

      display_board(board, total_rounds, round, difficulty, wins)

      if someone_won?(board)
        puts "#{detect_winner(board)} wins!\n".center(24)
        winner = detect_winner(board)
        increment_score(wins, winner)
        round += 1
      else
        prompt_message('tie')
        current_player = CURRENT_PLAYER.sample
      end

      continue_program
    end

    # Grand Champion
    champion = determine_champion(wins)
    display_grand_champion(champion, total_rounds, round, difficulty, wins)

    continue_program
    break if play_again? == 'n'
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

# MAIN PROGRAM

wins = { Player: 0,
         Computer: 0 }

loop do
  clear_screen
  puts_message('welcome')
  prompt_message('directory')
  choice = choose_directory

  case choice
  when '1' then play_tictactoe(wins)
  when '2' then display_instructions
  when '3' then break
  end
end

prompt_message('goodbye')
