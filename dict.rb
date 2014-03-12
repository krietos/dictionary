require './lib/dictionary'
require 'colorize'

def prompt
  print '>'
end

def main_menu
  puts "Welcome to the super fun dictionary!!\n\n"
  puts "A  - Add a term"
  if Term.terms.length > 0
    puts "L  - List your terms"
    puts "E  - Edit a term"
    puts "D  - Delete a term"
    puts "S  - Search for a term"
    puts "AD - Add definition"
    puts "AL - Add another language to a word"
    puts "X  - Exit"
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
  when 'D'
    delete_term
  when 'S'
    show_def
  when 'AD'
    add_new_def
  when 'AL'
    add_language
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
  puts "\n\n\nYou added #{new_term.word[0]} to your dictionary!"
  main_menu()
end

def show_terms
  puts "\n\nDictionary Terms:\n\n"
  Term.terms.each do |term|
    puts "#{term.word[0]}"
  end
  puts "---------------------\n\n"
  main_menu
end

def show_def
  puts "type a word to see its definition"
  lang_string = ''
  prompt
  word = gets.chomp.downcase
  found = find(word).pop
  if found != nil
    found.word.each_with_index do | val, ind |
      lang_string += "#{val} "
    end
    puts lang_string
    found.definition.each_with_index do | val, ind |
      puts "#{ind+1}: #{val}"
    end
  else
    puts "\n\ninvalid input\n\n"
  end
  puts "\n\n\n"
  main_menu
end

def edit_term
  puts "Enter a word to edit"
  input = gets.chomp.downcase
  found = find(input).pop
  if found != nil
    puts "\n\n#{input}"
    found.definition.each_with_index do | val, ind |
      puts "#{ind+1}: #{val}"
    end
    puts "Enter the number of the definition you want to change"
    index = gets.chomp.to_i-1
    puts "Enter a new definition"
    found.change_def(gets.chomp, index)
    puts "\n\n#{input}: #{found.definition[index]}\n\n"
  else
    puts "invalid input"
  end
main_menu()
end

def delete_term
  puts "Enter a word to delete"
  prompt
  word = gets.chomp
  found = find(word).pop
  if found != nil
    puts "\nAre you sure you want to delete #{word}? y "
    prompt
    if gets.chomp.downcase == 'y'
      Term.terms.delete(find(word).pop)
      puts "\n\nThat term has been deleted\n\n"
      main_menu
    end
  else
    puts "\n\nThat word is not in your dictionary\n\n"
    main_menu
  end
end

def add_new_def
  puts "Enter a word to add a definition"
  word = gets.chomp
  found = find(word).pop
  if found != nil
    puts "Enter a new definition for your word."
  prompt
  found.add_def(gets.chomp)
  puts "Definition added!"
  puts "\n\n#{found.word}:"
    found.definition.each_with_index do | val, ind |
      puts "#{ind+1}: #{val}"
    end
  else
    puts "That word is not in your dictionary"
  end
  puts "\n\n\n"
  main_menu
end

def add_language
  puts "Enter a word to add another language to?"
  word = gets.chomp
  found = find(word).pop
  if found != nil
    puts "Enter the word in another language."
    prompt
    found.add_lang(gets.chomp)
    puts "Language added!"
    found.word.each do | val |
      puts val
    end
  else
    puts "That word is not in your dictionary"
  end
  puts "\n\n\n"
  main_menu

end

def find(input)
  Term.terms.select do | val |
    val.word.include?(input.downcase)
  end
end


main_menu()
