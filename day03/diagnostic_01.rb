# frozen_string_literal: true

arr = File.readlines('input.txt', chomp: true)

a = arr.map { |el| el.chars.map(&:to_i) }
       .reduce { |a, b| a.each_index { |i| a[i] += b[i] } }
       .map { |el| el > arr.size / 2 }
       .map { |el| el ? 1 : 0 }

no1 = a.join.to_i(2)
no2 = a.map { |el| (el - 1).abs }.join.to_i(2)

p no1 * no2
