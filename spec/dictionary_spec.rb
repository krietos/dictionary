require('rspec')
require('dictionary')


describe Term do
  before do
    Term.clear
  end
  it('should create a new instance of the class Term') do
    new_term = Term.new('brentwood', 'some people think it is a tree')
      new_term.should(be_an_instance_of(Term))
    end
  it('should initilize a new instance with word and definitionls') do
    test_term = Term.new('Josh', 'A term for someone who writes Ruby like javascript')
    test_term.word.should(eq(['Josh']))
  end
  describe('.create') do
    it('should create a new instance of Term with word and definition') do
      test_term = Term.create('word', 'definition')
      test_term.word.should(eq(['word']))
    end
    it('should pass newly created instances of Term into @@terms') do
      test_term = Term.create('test', 'testdef')
      Term.terms.should(eq([test_term]))
    end
  end
  describe('.clear') do
    it('should clear out the @@terms array') do
      test_term = Term.create('word', 'def')
      Term.clear
      Term.terms.should(eq([]))
    end
  end
  describe('change_def') do
    it('should change the definition to the input') do
      test_term = Term.create('word', 'def')
      test_term.change_def('lala', 0)
      test_term.definition.should(eq(['lala']))
    end
  end
  describe('add_def') do
    it('should add another definition to an existing dictionary word') do
      test_term = Term.create('word', 'first_def')
      test_term.add_def('new_def')
      test_term.definition.should(eq(['first_def','new_def']))
    end
  end
  describe('add_lang') do
    it('should add another language to a word') do
      test_term = Term.create('word', 'def')
      test_term.add_lang('spanglish')
      test_term.word.should(eq(['word', 'spanglish']))
    end
  end
end

