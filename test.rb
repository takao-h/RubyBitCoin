# 板情報の取得

# ライブラリの指定
require 'net/http'
require 'uri'
require 'json'
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
puts response_hash["mid_price"]
