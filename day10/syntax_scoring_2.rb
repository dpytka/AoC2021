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
      char == ELEMENTS[stack.last] ? stack.pop : (return false)
    end
  end

  stack
end

POINTS = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4
}.freeze

def calculate_scoring(stack)
  stack.reverse.inject(0) { |sum, el| 5 * sum + POINTS[ELEMENTS[el]] }
end

scores = []
lines.each do |line|
  res = valid_line(line)
  scores << calculate_scoring(res) if res
end

p scores.sort[scores.size / 2]
