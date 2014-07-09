# #!/usr/bin/ruby
# require 'pry'
# class Sequence
#   def initialize(arg)
#     the_sequence(arg)
#   end

#   def the_sequence(arg)
#     counts = Hash.new(0)
#     @total = []
#     arr = arg.to_s.split('')
#     i = 0
#     while i < 1 do
#       for item in arr
#         counts.has_key?(item) && counts[item] ? counts[item] += 1 : counts[item] += 1
#         binding.pry
#       end
#       counts.each do |k, v|
#         @total << v
#         @total << k
#       end
#       p @total.join()
#       p arr = @total.join().split('')
#       counts.clear
#       i += 1
#     end
#   end
# end

# Sequence.new(1211)

module Enumerable
  def cluster
    cluster = []
    each do |element|
      cluster.last && cluster.last.last == element ? cluster.last << element : cluster << [element]
      end
    cluster
  end
end

class Sequence 
  include Enumerable

  attr_reader :arg
  
  def initialize(arg)
    @arg = arg
  end

  def next
    i = 0
    while i < 10 do
      total = []
      @arg = @arg.to_s.split('')
      @arg.cluster.map{ |x| total <<  x.uniq.unshift(x.size) }
      @arg = total.flatten!.join.to_i
      p self.arg
      i += 1
    end
  end
end

Sequence.new(1).next


