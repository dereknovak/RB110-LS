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

  puts "+-------+"
  if card.last == 10
    puts "|#{card.last}   #{card.last}|"
  else
    puts "| #{card.last}   #{card.last} |"
  end
  puts "|       |"
  puts "|   #{sym}   |"
  puts "|       |"
  if card.last == 10
    puts "|#{card.last}   #{card.last}|"
  else
    puts "| #{card.last}   #{card.last} |"
  end
  puts "+-------+\n\n"
end

def display_cards(cards)
  cards.each { |card| print_card(card) }
end

def display_first_2_cards(player_hand, dealer_hand)
  puts "=== First 2 Cards ===\n\n"

  puts "Player's Cards\n\n"
  display_cards(player_hand)

  continue?('dealer_cards')

  puts "Dealer's Cards\n\n"
  display_cards(dealer_hand)
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

def display_current_game(player, cards, sum, score, round)
  clear_screen

  puts "ROUND: #{round}".center(20)
  puts "Player: #{score[:player]} | Dealer: #{score[:dealer]}\n\n"

  puts "=== #{player.upcase} TURN ===\n\n"
  puts "Total Score: #{sum}\n\n"

  display_cards(cards)
end

def display_champion(round, score, champion)
  clear_screen

  puts "ROUND: #{round}"
  puts "Player: #{score[:player]} | Dealer: #{score[:dealer]}\n\n"

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

def determine_value(card, sum = 0)
  case card.last
  when 'A'
                  1 if sum >= 11
                 11 if sum <  11 
  when 'J'  then 10
  when 'Q' then  10
  when 'K'  then 10
  else           card.last
  end
end

def shuffle_deck
  CARDS.shuffle
end

def retrieve_values(cards, sum = 0)
  cards.map { |card| determine_value(card, sum) }
end

def winner?(score, rounds)
  score[:player] > rounds / 2.0 || score[:dealer] > rounds / 2.0
end

def determine_champion(score)
  score[:player] > score[:dealer] ? 'Player' : 'Dealer' 
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
        puts "Dealer hands you another card...\n\n"
        sleep(1.5)
        return 'hit'
      when move.start_with?('s')
        puts "Saving score...\n\n"
        sleep(1.5)
        return 'stay'
      end
    end

    prompt_message('valid_move')
  end
end

def take_turn(deck, hand, values, sum)
  hand << deal_card(deck)
  values << determine_value(hand.last)
  values.sum
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
    load_game
    clear_screen

    rounds = choose_game_duration
    round = 1
    score = { player: 0, dealer: 0 }
    
    loop do
      display_round(round)
      sleep(2)
      
      clear_screen
      deck = shuffle_deck
      tie = false
      
      player_hand = deal_card(deck), deal_card(deck)
      dealer_hand = [deal_card(deck)]

      player_values = retrieve_values(player_hand)
      dealer_values = retrieve_values(dealer_hand)

      player_sum = player_values.sum
      dealer_sum = dealer_values.sum

      display_first_2_cards(player_hand, dealer_hand)


      until player_sum >= MAX_SCORE
        display_current_game('player', player_hand, player_sum, score, round)
        choice = hit_or_stay?
        break if choice == 'stay'
        player_sum = take_turn(deck, player_hand, player_values, player_sum)
      end

      display_current_game('player', player_hand, player_sum, score, round)

      if player_sum > MAX_SCORE
        score[:dealer] += 1
        puts_message('player_bust')
      elsif player_sum == MAX_SCORE
        score[:player] += 1
        puts_message('twenty_one')
      else
        loop do
          display_current_game('dealer', dealer_hand, dealer_sum, score, round)
          sleep(1)

          if dealer_sum < 17
            dealer_sum = take_turn(deck, dealer_hand, dealer_values, dealer_sum)
          else
            break
          end

          break if dealer_sum >= MAX_SCORE
        end
        
        display_current_game('dealer', dealer_hand, dealer_sum, score, round)

        if dealer_sum > MAX_SCORE
          score[:player] += 1
          puts_message('dealer_bust')
        elsif player_sum > dealer_sum
          puts "Too risky to hit again...\n\n"
          sleep(1.5)
          score[:player] += 1
          puts_message('player_win')
        elsif player_sum < dealer_sum
          score[:dealer] += 1
          puts_message('dealer_win')
        else
          prompt_message('tie')
          tie = true
        end
      end
      
      continue?
      
      break if winner?(score, rounds)
      round += 1 unless tie
    end

    clear_screen
    champion = determine_champion(score)
    display_champion(round, score, champion)

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
