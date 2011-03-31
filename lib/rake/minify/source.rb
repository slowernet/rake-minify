
class Source
  attr_reader :source, :minify

  def initialize(source, minify)
    @source = source
    @minify = minify
  end

  def build
    Kernel.open(source) do |input|
      minify && JSMin.minify(input.read) || input.read
    end
  end
end
