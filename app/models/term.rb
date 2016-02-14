class Term

  @@punctuation = "[.,?!:;\s]"

  attr_reader :regex

  def initialize(original_term)
    @original_term = original_term.strip
    @regex = self_regexing
  end

  def in?(string)
    regex =~ string || @original_term == string
  end

  def to_s
    @original_term
  end

  private

  def self_regexing
    term = @original_term.dup.strip
    term = term[0] == '*' ? term[1..-1] : "(#{@@punctuation}|\\A)#{term}"
    term = term[-1] == '*' ? term[0..-2] : "#{term}(#{@@punctuation}|\\Z)" 
    term.gsub!('*', '\w*')
    term.gsub!('"', '')
    Regexp.new(term)
  end

end
