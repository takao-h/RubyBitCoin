# 板情報の取得

# ライブラリの指定
require 'net/http'
require 'uri'
require 'json'
# key.rbの内容が使えるようになる.今はサンプルなのでコメントアウト
# require './key'

def reqest_board_info
  # endpoint
  uri = URI.parse("https://api.bitflyer.jp")
  # api request_uri
  uri.path = '/v1/getboard'
  # クエリの選択
  uri.query = ''

  # htpps通信の設定
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  response = https.get uri.request_uri

  # 吐き出し
  # puts response.body

  # JSONに変換してカラムを指定
  response_hash = JSON.parse(response.body)
  response_hash["mid_price"]
end


def order(order , price, size)
  # key.rbで定義したAPI_KEYとAPI_SECLETを代入
  key = API_KEY
  secret = API_SECRET

  timestamp = Time.now.to_i.to_s
  method = "POST"
  uri = URI.parse("https://api.bitflyer.jp")
  uri.path = "/v1/me/sendchildorder"
  # product_code
  body = '{
    "product_code": "BTC_JPY",
    "child_order_type": "LIMIT",
    "side": "'+ order +'",
    "price":' + price +',
    "size":' + size +',
    "minute_to_expire": 10000,
    "time_in_force": "GTC"
  }'

  text = timestamp + method + uri.request_uri + body
  sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, text)

  options = Net::HTTP::Post.new(uri.request_uri, initheader = {
    "ACCESS-KEY" => key,
    "ACCESS-TIMESTAMP" => timestamp,
    "ACCESS-SIGN" => sign,
    "Content-Type" => "application/json"
  });
  options.body = body

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  response = https.request(options)
  puts response.body
end
