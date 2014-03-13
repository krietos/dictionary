class Word
  def Word.create(content, language)
    new_word = Word.new(content, language)
  end
  def initialize(content, language)
    @content = content
    @language = language
    @all_content = []
    @all_content << content
  end

  def content
    @content
  end

  def change_content(new_content, index)
    @all_content[index] = new_content
  end

  def all_content
    @all_content
  end

  def add_content(new_content)
    @all_content << new_content
  end

  def language
    @language
  end
end
