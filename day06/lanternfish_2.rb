# frozen_string_literal: true

fishes_a = File.read('input.txt').split(',').map(&:to_i)
fishes = Hash.new(0).tap { |h| 9.times { |idx| h[idx] = fishes_a.count(idx) } }

256.times do
  reproducing = fishes[0]
  (0..7).each do |idx|
    fishes[idx] = fishes[idx + 1]
  end

  fishes[8] = reproducing
  fishes[6] += reproducing
end

p fishes.values.sum
