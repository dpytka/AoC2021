# frozen_string_literal: true

def calc(table, num)
  p table.flatten.compact.sum * num
end


file = File.new('input.txt')
numbers = file.gets(chomp: true).split(',').map(&:to_i)

tables1 = []
tables2 = []
until file.eof? do
  arr = []
  file.gets(chomp: true)
  arr << file.gets(chomp: true).split.map(&:to_i)
  arr << file.gets(chomp: true).split.map(&:to_i)
  arr << file.gets(chomp: true).split.map(&:to_i)
  arr << file.gets(chomp: true).split.map(&:to_i)
  arr << file.gets(chomp: true).split.map(&:to_i)
  tables1 << arr
  tables2 << arr.transpose
end

numbers.each do |num|
  tables1.each_index do |x|
    tables1[x].each_index do |y|
      tables1[x][y].each_index { |z| tables1[x][y][z] = nil if tables1[x][y][z] == num }
    end
  end

  tables1.each_index do |x|
    tables1[x].each_index do |y|
      return calc(tables1[x], num) if tables1[x][y].all?(&:nil?)
    end
  end

  tables2.each_index do |x|
    tables2[x].each_index do |y|
      tables2[x][y].each_index { |z| tables2[x][y][z] = nil if tables2[x][y][z] == num }
    end
  end

  tables2.each_index do |x|
    tables2[x].each_index do |y|
      return calc(tables2[x], num) if tables2[x][y].all?(&:nil?)
    end
  end
end
