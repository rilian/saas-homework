# metaprogramming to the rescue!

# a)
class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args, &block)
    if method_id == :in
      convert_to = args[0].to_s.gsub( /s$/, '')
      if @@currencies.has_key?(convert_to)
        self / @@currencies[convert_to]
      else
        super
      end
    else
      singular_currency = method_id.to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        self * @@currencies[singular_currency]
      else
        super
      end
    end
  end
end

#tests
if ENV['TEST']
  success = total =0

  begin
    total += 1
    val = 5.dollars.in(:euros)
    puts "5.dollars.in(:euros) = #{val}"
    success += 1 if val > 3.86 && val < 3.87
  rescue
      nil
  end
  begin
    total += 1
    val = 10.euros.in(:rupees)
    puts "10.euros.in(:rupees) = #{val}"
    success += 1 if val >= 680.0 && val <= 680.0
  rescue
      nil
  end
  begin
    total += 1
    val = 1.dollar.in(:rupees)
    puts "1.dollar.in(:rupees) = #{val}"
    success += 1 if val > 52.63 && val < 52.64
  rescue
      nil
  end
  begin
    total += 1
    val = 10.rupees.in(:euro)
    puts "10.rupees.in(:euro) = #{val}"
    success += 1 if val > 0.14705 && val < 0.14706
  rescue
      nil
  end
  begin
    total += 1
    val = 10.yens.in(:rupees)
    puts "10.yens.in(:rupees) = #{val}"
    success += 1 if val > 6.84 && val < 6.85
  rescue
      nil
  end
  begin
    total += 1
    val = 1.dollars.in(:dollars)
    puts "1.dollars.in(:dollars) = #{val}"
    success += 1 if val == 1.0
  rescue
      nil
  end

  puts "\nTest #{success}/#{total}"
end

# b)

def palindrome?(string)
  string = string.downcase.gsub(/[^a-z]/,'')
  length = string.length / 2
  string[0, length] == string[-length, length].reverse
end

# c)


