# frozen_string_literal: true

fishes = File.read('test_input.txt').split(',').map(&:to_i)

80.times do
  new_fish = 0
  fishes.each_with_index do |timer, i|
    if timer.zero?
      new_fish += 1
      fishes[i] = 6
    else
      fishes[i] -= 1
    end
  end
  fishes.concat([8] * new_fish)
end

p fishes.size
