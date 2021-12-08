# frozen_string_literal: true

p File.readlines('input.txt', chomp: true)
      .map { |el| el.split('|')[1] }
      .map(&:split)
      .flatten
      .filter { |el| [2, 3, 4, 7].include?(el.size) }
      .count
