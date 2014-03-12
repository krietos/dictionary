require './lib/dictionary'

def prompt
  print '>'
end

def main_menu
  puts "Welcome to the super fun dictionary!!\n\n"
  puts "A - Add a term"
  if Term.terms.length > 0
    puts "L - List your terms"
    puts "E - Edit a term"
    puts "D - Delete a term"
    puts "X - Exit"
  end
  input = gets.chomp.upcase
  case input
  when 'A'
    add_word()
  when 'L'
    show_terms
  when 'E'
    edit_term
  when 'X'
  else
    puts "invalid input"
    main_menu
  end
end
def add_word
  puts "\n\n\nAdd a word to your dictionary."
  prompt
  word = gets.chomp.downcase
  puts word
  puts "Now add a definition for the word"
  prompt
  definition = gets.chomp
  new_term = Term.create(word, definition)
  puts "\n\n\nYou added #{new_term.word} to your dictionary!"
  main_menu()
end

def show_terms
  puts "\n\nDictionary Terms"
  Term.terms.each do |term|
    puts "#{term.word}"
  end
  puts "---------------------\n\n"
  puts "type a word to see its definition"
  prompt
  word = gets.chomp.downcase
  show_def(word)

end

def show_def(word)
  found = find(word).pop
  if found != nil
    puts "\n\n#{found.word}: #{found.definition}\n\n"
  else
    puts "\n\ninvalid input\n\n"
  end
  main_menu
end

def edit_term
  puts "Enter a word to edit"
  input = gets.chomp.downcase
  found = find(input).pop
  if found != nil
    puts "Enter a new definition"
    found.change_def(gets.chomp)
    puts "\n\n#{found.word}: #{found.definition}\n\n"
  else
    puts "invalid input"
  end
main_menu()
end

def find(input)
  Term.terms.select do | val |
    val.word == input.downcase
  end
end


main_menu()
