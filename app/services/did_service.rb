require 'faraday'
require 'json'

class DidService
  API_KEY = "MjIxMTE4MDEwQHNhbXN1bi5lZHUudHI:bC5_iBfEVEybN1fJ0Xxkn"
  BASE_URL = "https://api.d-id.com"

  # D-ID dokümantasyonunda kullanılan standart test görseli
  DEFAULT_AVATAR = "https://raw.githubusercontent.com/jjranalli/speech-to-video/main/img/image.jpg"

  def create_talk(text, avatar_url = nil)
    # Eğer parametre gelmezse varsayılanı kullan
    avatar_url ||= DEFAULT_AVATAR

    conn = Faraday.new(url: BASE_URL) do |f|
      # Basic Auth: Kullanıcı adı ve şifreyi ayırıp gönderiyoruz
      f.request :authorization, :basic, API_KEY.split(':')[0], API_KEY.split(':')[1]
      f.headers['Content-Type'] = 'application/json'
      f.adapter Faraday.default_adapter
    end

    # EN BASİT PAYLOAD (Hata riskini azaltmak için)
    # Voice ayarlarını sildik, D-ID varsayılan sesi kullanacak.
    payload = {
      source_url: avatar_url,
      script: {
        type: "text",
        input: text
      }
    }

    response = conn.post("/talks", payload.to_json)
    
    # Yanıtı parse et
    begin
      result = JSON.parse(response.body)
    rescue JSON::ParserError
      result = { "raw_body" => response.body }
    end
    
    # HTTP durumunu ekle
    result['http_status'] = response.status
    result
  end
end