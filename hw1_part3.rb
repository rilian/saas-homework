def combine_anagrams(words)
  words.group_by {|w| w.downcase.split(//).sort.to_s}.values
end

# tests
#puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).inspect
#puts [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]].inspect
#puts 'ok' if combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).sort == [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]].sort
