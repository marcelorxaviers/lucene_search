class LuceneSearch

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def test(string)
    evaluate(string)
  end

  private

  def evaluate(string)
    parsed = @query.dup
    @query.split(/AND|OR/).each do |t|
      term = Term.new(t)
      parsed.sub!(term.to_s, term.in?(string).to_s)
    end
    parsed = parsed.gsub('AND', '&&').gsub('OR', '||')
    eval(parsed)
  end

end
