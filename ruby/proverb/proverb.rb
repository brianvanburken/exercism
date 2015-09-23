class Proverb
  def initialize(*verbs, opts)
    @verbs = verbs
    unless opts.is_a? Hash
      @verbs << opts
      @qualifier = nil
    else
      @qualifier = opts[:qualifier]
    end
  end

  def to_s
    result = ''
    @verbs.each_cons(2) do |verb, next_verb|
      result << "For want of a #{verb} the #{next_verb} was lost.\n"
    end
    result << "And all for the want of a #{final_consequence}."
  end

  private

  def final_consequence
    [@qualifier, @verbs.first].compact.join ' '
  end
end