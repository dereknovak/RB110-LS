require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('twentyone_messages.yml')

# Extra Methods

def clear_screen
  system('clear') || system('cls')
end

def load_game
  clear_screen
  puts_message('loading')

  17.times do |i|
    print '█'
    sleep(0.015 * i)
  end

  sleep(0.3)
end

# Output Methods

def prompt(message)
  puts "=> #{message}"
end

def puts_message(message)
  puts MESSAGES[message]
end

def prompt_message(message)
  puts "=> #{MESSAGES[message]}"
end

def view_instructions
  clear_screen
  puts_message('instructions')
  continue?
end

def print_card(card)
  case card.first
  when 'hearts'   then sym = '♥'
  when 'diamonds' then sym = '♦'
  when 'clubs'    then sym = '♣'
  when 'spades'   then sym = '♠'
  end

  puts "+-------+".center(20)
  if card.last == 10
    puts "|#{card.last}   #{card.last}|".center(20)
  else
    puts "| #{card.last}   #{card.last} |".center(20)
  end
  puts "|       |".center(20)
  puts "|   #{sym}   |".center(20)
  puts "|       |".center(20)
  if card.last == 10
    puts "|#{card.last}   #{card.last}|".center(20)
  else
    puts "| #{card.last}   #{card.last} |".center(20)
  end
  puts "+-------+\n\n".center(21)
end

def display_cards(cards)
  cards.each { |card| print_card(card) }
end

def display_first_2_cards(player_cards, dealer_cards)
  puts "=== First 2 Cards ===\n\n"

  puts "Player's Cards\n\n"
  display_cards(player_cards)

  continue?('dealer_cards')

  puts "Dealer's Cards\n\n"
  display_cards(dealer_cards)
  puts_message('mystery')

  continue?('start_game')
end

def display_round(round)
  clear_screen

  puts ''
  puts "#########\n\n"
  puts "ROUND #{round}\n".center(10)
  puts "#########"
  puts ''
end

def display_current_game(player, cards, round_score, game_score, round, rounds)
  clear_screen
  display_game_total(game_score, rounds)
  display_round_total(round_score, round)
  
  puts "=== #{player.upcase} TURN ===\n\n"
  display_cards(cards)
end

def display_game_total(game_score, rounds)
  puts "BEST OF #{rounds}".center(20)
  puts "Player: #{game_score[:player]} | Dealer: #{game_score[:dealer]}\n\n"
end

def display_round_total(round_score, round)
  puts "ROUND #{round}".center(20)
  puts "Player: #{round_score[:player]} | Dealer: #{round_score[:dealer]}\n\n"
end

def display_champion(rounds, game_score, champion)
  clear_screen
  display_game_total(game_score, rounds)

  case champion
  when 'Player' then puts_message('player_champion')
  when 'Dealer' then puts_message('dealer_champion')
  end
end

# Input Methods

def continue?(message = 'continue')
  prompt_message(message)
  gets
end

def choose_directory
  loop do
    option = gets.chomp
    return option if option =~ /^[1-3]$/
    prompt_message('valid_directory')
  end
end

def choose_game_duration
  prompt_message('rounds')

  valid_rounds = [1, 3, 5, 7, 9]
  loop do
    rounds = gets.chomp.to_i
    return rounds if valid_rounds.include?(rounds)
    prompt_message('valid_rounds')
  end
end

# Processing Methods

def determine_value(card, round_score, player)
  case card.last
  when 'A'
                 return 1 if round_score[player] >= 11
                 return 11 if round_score[player] < 11 
  when 'J'  then 10
  when 'Q' then  10
  when 'K'  then 10
  else           card.last
  end
end

def shuffle_deck
  CARDS.shuffle
end

def winner?(game_score, rounds)
  game_score[:player] > rounds / 2.0 || game_score[:dealer] > rounds / 2.0
end

def determine_champion(game_score)
  game_score[:player] > game_score[:dealer] ? 'Player' : 'Dealer' 
end

def declare_round_winner(game_score, round_score)
  if busted?(:dealer, round_score)
    game_score[:player] += 1
    puts_message('bust')
    sleep(1)
    puts_message('player_win')
  elsif round_score[:player] > round_score[:dealer]
    puts "Too risky to hit again...\n\n"
    sleep(1.5)
    game_score[:player] += 1
    puts_message('player_win')
  elsif round_score[:player] < round_score[:dealer]
    game_score[:dealer] += 1
    puts_message('dealer_win')
  else
    prompt_message('tie')
    true
  end
end

def too_risky?(player, round_score)
  round_score[player] > 16
end

def busted?(player, round_score)
  round_score[player] > MAX_SCORE
end

def twenty_one?(player, round_score)
  round_score[player] == MAX_SCORE
end

def won?(round_score)
  round_score[:dealer] > round_score[:player]
end

# Gameplay Methods

def deal_card(deck)
 deck.delete(deck.sample)
end

def hit_or_stay?
  valid_choices = %w(hit stay h s)
  prompt_message('hit_or_stay')
  loop do
    move = gets.chomp.downcase

    if valid_choices.include?(move)
      case
      when move.start_with?('h')
        puts_message('hand_card')
        sleep(1.5)
        return 'hit'
      when move.start_with?('s')
        puts_message('save_score')
        sleep(1.5)
        return 'stay'
      end
    end

    prompt_message('valid_move')
  end
end

def take_turn(player, deck, round_score, cards)
  cards << deal_card(deck)
  round_score[player] += determine_value(cards.last, round_score, player)
end

def dealer_turn(deck, round_score, game_score, dealer_cards, round, rounds)
  loop do
    display_current_game('dealer', dealer_cards, round_score, game_score, round, rounds)
    sleep(1)
    take_turn(:dealer, deck, round_score, dealer_cards)

    return if busted?(:dealer, round_score) ||
              twenty_one?(:dealer, round_score) ||
              too_risky?(:dealer, round_score) ||
              won?(round_score)
  end
end

def play_again?
  prompt_message('again?')
  valid_choices = %w(yes no y n)

  loop do
    choice = gets.chomp
    return true  if choice.start_with?('y')
    return false if choice.start_with?('n')
    prompt_message('yes_no')
  end
end

# Main Game Method

def play_game
  clear_screen
  
  loop do
    clear_screen
    
    rounds = choose_game_duration
    round = 1
    game_score = { player: 0, dealer: 0 }

    load_game

    loop do
      display_round(round)
      sleep(1.5)
      
      clear_screen
      deck = shuffle_deck
      tie = false
      round_score = { player: 0, dealer: 0 }
      player_cards = []
      dealer_cards = []

      take_turn(:player, deck, round_score, player_cards)
      take_turn(:player, deck, round_score, player_cards)
     
      take_turn(:dealer, deck, round_score, dealer_cards)

      display_first_2_cards(player_cards, dealer_cards)

      until busted?(:player, round_score) || twenty_one?(:player, round_score)
        display_current_game('player', player_cards, round_score, game_score, round, rounds)
        choice = hit_or_stay?
        break if choice == 'stay'
        take_turn(:player, deck, round_score, player_cards)
      end

      display_current_game('player', player_cards, round_score, game_score, round, rounds)

      if busted?(:player, round_score)
        game_score[:dealer] += 1
        puts_message('bust')
        sleep(1)
        puts_message('dealer_win')
      elsif twenty_one?(:player, round_score)
        game_score[:player] += 1
        puts_message('twenty_one')
      else
        dealer_turn(deck, round_score, game_score, dealer_cards, round, rounds)        
        display_current_game('dealer', dealer_cards, round_score, game_score, round, rounds)        
        tie = declare_round_winner(game_score, round_score)
      end
      
      continue?
      break if winner?(game_score, rounds)
      round += 1 unless tie
    end

    clear_screen
    champion = determine_champion(game_score)
    display_champion(rounds, game_score, champion)

    break unless play_again?
  end
end


# MAIN PROGRAM

MAX_SCORE = 21
CARD_TYPES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
SUITS = %w(hearts diamonds clubs spades)
CARDS = SUITS.product(CARD_TYPES)

loop do
  clear_screen
  puts_message('directory')
  option = choose_directory

  case option
  when '1' then play_game
  when '2' then view_instructions
  when '3' then break
  end 
end

clear_screen
puts ''
puts_message('goodbye')
