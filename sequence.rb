# #!/usr/bin/ruby

require 'pry'

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


