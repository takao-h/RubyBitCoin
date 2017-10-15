require "./method"
require "./training_No1"
require "./key"


while (1)
  current_price = reqest_board_info
  buy_price = 490000
  sell_price = 500000
  if (current_price > 500000) && (get_my_balance("BTC")["amount"] > 0.001)
    puts "BTCの価格が¥500000を上回っています。"
    # 売り注文
    order("SELL", buy_price , 0.01)
  elseif (480000 < current_price < 500000) && (get_my_balance("JPY")["amount"] > 1000)
    puts "BTCの価格が¥500000から¥4800000の間にあります"
  else current_price < 480000
    puts "BTCの値段が¥480000をしたわまりました。"
    # 買い注文
    order("BUY", sell_price, 0.01)
  end

  sleep(1)
end
