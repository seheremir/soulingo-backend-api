source "https://rubygems.org"

ruby "3.4.7"

# Rails 7.1.3 (SQLite 1.7 ile uyumlu stabil sürüm)
gem "rails", "~> 7.1.3"

# Veritabanı (Windows uyumlu sürüm)
gem "sqlite3", "~> 1.7.3"

# Sunucu
gem "puma", ">= 5.0"

# Auth
gem "bcrypt", "~> 3.1.7"

# API & CORS
gem "rack-cors"
gem "faraday"
gem "faraday-multipart"

# Performans
gem "bootsnap", require: false

# Windows Timezone Hatası için
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end
gem "jwt", "~> 3.1"
