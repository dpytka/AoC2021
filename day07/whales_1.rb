# frozen_string_literal: true

pos = File.open('test_input.txt').read.split(',').map(&:to_i)

min_val = 10_000_000_000
(pos.min..pos.max).each do |val|
  new_min = pos.sum { |el| (el - val).abs }
  min_val = new_min if min_val > new_min
end

p min_val
