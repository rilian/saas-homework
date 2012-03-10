def palindrome?(string)
  string = string.downcase.gsub(/[^a-z]/,'')
  length = string.length / 2
  string[0, length] == string[-length, length].reverse
end

def count_words(string)
  res = {}
  string.downcase.gsub(/[^a-z\s]/,'').gsub(/\s\s/,' ').split(/\b\s/).map { |a| res[a] = res[a] ? res[a] + 1 : 1}
  res
end

# tests
#success = 0
#success +=1 if palindrome?("A man, a plan, a canal -- Panama")
#success +=1 if palindrome?("Madam, I'm Adam!")
#success +=1 if palindrome?("Abracadabra").nil? || !palindrome?("Abracadabra")
#
#success +=1 if count_words("A man, a plan, a canal -- Panama") == {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
#success +=1 if count_words("Doo bee doo bee doo") == {'doo' => 3, 'bee' => 2}
#
#puts "#{success}/5 are OK"