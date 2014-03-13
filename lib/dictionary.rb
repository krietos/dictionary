class Term
  @@terms = []
  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def word
    @word
  end

  def add_lang(new_lang)
    @word << new_lang
  end
  def definition
    @definition
  end

  def change_def(new_definition, index)
    @definition[index] = new_definition
  end

  def add_def(new_def)
    @definition << new_def
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    @@terms << new_term
    new_term
  end

  def Term.terms
    @@terms
  end

  def Term.clear
    @@terms = []
  end
end

