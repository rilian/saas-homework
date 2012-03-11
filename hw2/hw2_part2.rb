class CartesianProduct
  include Enumerable

  def initialize(a, b)
    @values = []
    unless a == [] || b == []
      a.collect {|x| b.collect {|q| @values << [x,q] } }
    end
  end

  def each(&block)
    @values.each(&block)
  end
end

if ENV['TEST']
  c = CartesianProduct.new([:a,:b], [4,5])
  c.each { |elt| puts elt.inspect }
  # [:a, 4]
  # [:a, 5]
  # [:b, 4]
  # [:b, 5]

  c = CartesianProduct.new([:a,:b], [])
  c.each { |elt| puts elt.inspect }
  # (nothing printed since Cartesian product
  # of anything with an empty collection is empty)
end