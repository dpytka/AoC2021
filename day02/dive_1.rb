# frozen_string_literal: true

horizontal = 0
depth = 0
File.readlines('input.txt').map(&:split).each do |e|
  case e[0]
  when 'forward'
    horizontal += e[1].to_i
  when 'up'
    depth -= e[1].to_i
  when 'down'
    depth += e[1].to_i
  end
end

p horizontal * depth
