module Enumerable
  def produce(init = nil, &block)
    first = init.nil? ? self.first : init

    memo = first
    acc = [first]

    each_with_index do |value, i|
      next if init.nil? && i.zero?

      memo = block.call(memo, value)
      acc << memo
    end

    acc
  end
end

def assert(value)
  value or raise "Failed assertion: #{value.inspect} is not true"
end

assert([1, 3, 6, 10] == (1..4).produce(&:+))
