# 今の資産状況を取得するメソッドの作成
require "net/http"
require "uri"
require "openssl"
require "./key"

def get_my_balance(coin_name)
  key = "{{ API_KEY }}"
  secret = "{{ API_SECRET }}"

  timestamp = Time.now.to_i.to_s
  method = "GET"
  uri = URI.parse("https://api.bitflyer.jp")
  uri.path = "/v1/me/getbalance"


  text = timestamp + method + uri.request_uri
  sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, text)

  options = Net::HTTP::Get.new(uri.request_uri, initheader = {
    "ACCESS-KEY" => key,
    "ACCESS-TIMESTAMP" => timestamp,
    "ACCESS-SIGN" => sign,
  });

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  response = https.request(options)
  response_hash = JSON.parse(response.body)
  # 日本円だけ取得 => .find{in | n}でnに指定された文字列に一致するカラムを選択できる
  puts response_hash.find {in| n["currency_code"] == coin_name}
end
