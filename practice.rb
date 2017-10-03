
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
=end
def ave(japanise , math, science, social)
  (japanise + math + science + social)/4
end
puts ave(80, 70, 60, 40)
