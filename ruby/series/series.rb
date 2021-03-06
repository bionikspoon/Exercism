class Series
  def initialize(input)
    @input = input
  end

  def slices(length)
    raise ArgumentError if length > input.length

    input.each_char.each_cons(length).map(&:join)
  end

  private

  attr_reader :input
end
