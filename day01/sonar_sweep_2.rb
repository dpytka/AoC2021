x = []
i = 0
File.readlines('input.txt').map(&:to_i).each_cons(3) { |a| x << a.sum }
x.each_cons(2) { |a| i += 1 if a[1] > a[0] }
p i
