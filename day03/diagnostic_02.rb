# frozen_string_literal: true

arr = File.readlines('test_input.txt', chomp: true).map { |el| el.chars.map(&:to_i) }
arr_len = arr.size
arr_el_len = arr[0].size

(0..arr_el_len).each_with_index do |idx|
  x = arr.transpose
  i = 0
  x.reduce { |sum, n| i += n[idx] }
  p i
end

p arr
