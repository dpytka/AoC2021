# frozen_string_literal: true

lines = File.readlines('input.txt', chomp: true)

ELEMENTS = {
  '(' => ')',
  '{' => '}',
  '[' => ']',
  '<' => '>'
}.freeze

OPEN_ELEMENTS = ELEMENTS.keys
CLOSE_ELEMENTS = ELEMENTS.values

def valid_line(line)
  stack = []

  line.each_char do |char|
    if OPEN_ELEMENTS.include?(char)
      stack << char
    elsif CLOSE_ELEMENTS.include?(char)
      char == ELEMENTS[stack.last] ? stack.pop : (return char)
    end
  end

  stack.empty?
end

POINTS = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25_137
}.freeze

points = 0
lines.each do |line|
  res = valid_line(line)
  points += POINTS[res] if res.is_a? String
end

p points
