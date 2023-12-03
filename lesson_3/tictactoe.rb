require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('tictactoe_messages.yml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

def continue_program
  prompt_message('continue?')
  gets.chomp
end

# Display Methods

def display_round_info(total_rounds, round, player_wins, computer_wins)
  puts "        BEST OF #{total_rounds}"
  puts "         ROUND #{round}"
  puts "  Player #{player_wins} | Computer #{computer_wins}"
  puts ''
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, total_rounds, round, player_wins, computer_wins)
  clear_screen
  display_round_info(total_rounds, round, player_wins, computer_wins)
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

def display_grand_champion(champion, total_rounds, round, player_wins, computer_wins)
  round -= 1
  clear_screen
  display_round_info(total_rounds, round, player_wins, computer_wins)
  puts "The #{champion} is the GRAND CHAMPION!\n\n"
end

def display_instructions
  clear_screen
  puts_message('instructions')
  continue_program
end

# Get Methods

def get_choice
  valid_choices = %w(1 2 3)
  loop do
    choice = gets.chomp
    return choice if valid_choices.include?(choice)
    prompt_message('valid_choice')
  end
end

def get_total_rounds
  prompt_message("rounds?")
  loop do
    rounds = gets.chomp.to_f
    if rounds % 1 != 0
      prompt_message('valid_integer')
    elsif rounds.to_i.odd? && rounds > 0
      return rounds.to_i
    else
      prompt_message('odd_integer')
    end
  end
end

def get_yes_or_no
  loop do
    choice = gets.chomp
    return 'y' if choice.start_with?('y')
    return 'n' if choice.start_with?('n')
    prompt_message('yes_or_no')
  end
end

def get_grand_champion(player_wins, computer_wins)
  player_wins > computer_wins ? 'Player' : 'Computer'
end

# Extraneous Methods

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt_message('valid_square')
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
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

# Main Tic-Tac-Toe game

def play_game
  round = 1
  player_wins = 0
  computer_wins = 0
  total_rounds = get_total_rounds

  until total_rounds / 2 < player_wins || total_rounds / 2 < computer_wins
    board = initialize_board

    loop do
      display_board(board, total_rounds, round, player_wins, computer_wins)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      display_board(board, total_rounds, round, player_wins, computer_wins)
      prompt_message('thinking')
      # sleep(2)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      display_board(board, total_rounds, round, player_wins, computer_wins)
    end

    display_board(board, total_rounds, round, player_wins, computer_wins)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      case detect_winner(board)
      when 'Player'   then player_wins += 1
      when 'Computer' then computer_wins += 1
      end
      round += 1
    else
      prompt_message('tie')
    end
    continue_program
  end

  display_board(board, total_rounds, round, player_wins, computer_wins)
  champion = get_grand_champion(player_wins, computer_wins)
  display_grand_champion(champion, total_rounds, round, player_wins, computer_wins)
  continue_program
end

# MAIN PROGRAM

loop do
  clear_screen
  puts_message('welcome')
  puts_message('directory')
  choice = get_choice

  case choice
  when '1' then play_game
  when '2' then display_instructions
  when '3' then break
  end
end

prompt_message('goodbye')
