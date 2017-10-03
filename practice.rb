
=begin
puts "hello!!"

japanise = 80
math = 70
science = 60
social = 40
puts (japanise + math + science + social)/4
luck = {:100 => "大吉", :90 =>"中吉", :80 => "吉", :70 => "小吉"}
luck = ["大吉", "中吉", "小吉"]
puts luck.sample

def gread
  puts "hoge"
  puts "fuga"
end

puts gread

def ave(japanise , math, science, social)
  (japanise + math + science + social)/4
end
puts ave(80, 70, 60, 40)

luck = ["大吉", "中吉", "小吉"]
10.times do
  puts luck.sample
  sleep(4)
end
a = {:"japanise" => 90, :"math" => 80, :"sciencr" => 70}

=end
def is_three(num)
  if num % 3 == 0
    sleep(2)
    puts "3の倍数です"
  end
end

num = 1
30.times do
  num = num + 1
  puts num
  is_three(num)
end
