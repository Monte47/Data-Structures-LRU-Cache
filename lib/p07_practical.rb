require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  chars_hash = HashMap.new
  string.chars.each do |char|
    if chars_hash[char]
      chars_hash[char] += 1
    else
      chars_hash[char] = 1
    end
  end

  num_odd = 0
  chars_hash.each do |key, val|
    num_odd += 1 unless val % 2 == 0
  end
  return num_odd < 2
end
