def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  rand(1...11)
end

def display_card_total(card_total)
  # code #display_card_total here
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp #gets user_input and chomps off new line that is automatically added to input when using gets method
end

def end_game(card_total)
  # code #end_game here
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  # code #initial_round here
  card1 = deal_card #deal card (first card)
  card2 = deal_card #deal card (second card)
  sum = card1 + card2
  display_card_total(sum) #call on display_card_total and pass local variable 'sum' in as the argument
  return sum #return sum of two dealt cards // note: this needs to be last thing called in method
end #end method


def hit?(card_total) #card_total is the argument /// had to view other student's work to get this method working...
  # code hit? here
  prompt_user #calls this method to ask player to type 'h' or 's' (hit or stay)
  #get_user_input #calling this on its own before below line breaks the method for some reason, not sure why // <<<------
  answer = get_user_input #calls this method to get user input, 'h' or 's' // <<<---- why can't i call get_user_input THEN assign answer to get_user_input? it breaks when i do that.

  if answer == "h" #if user hits 'h'...
    card3 = deal_card #...deal user another card, card3
    sum = card_total + card3 #sum = previous card_total plus card3
    return sum #this is the new card_total, AKA card_total + card3
  elsif answer == "s"
    return card_total #return card_total (same card_total as before argument)
  else
    invalid_command
  end #end if..else statement
end #end method


def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

# Ruby until Statement syntax:
# until conditional [do]
#    code
# end

def runner ## // had to view other student's work to get this method working as well...
  # code runner here
  welcome
  card_total = initial_round #initial_round deals first two cards -- this method includes display_card_total(sum)

  until (card_total > 21) do #ask player if they'd like to hit until they bust
    card_total = hit?(card_total)
  end #end until
  display_card_total(card_total) #display new card_total
  end_game(card_total) #end game because player busted
end #end method
