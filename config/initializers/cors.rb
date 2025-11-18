Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Güvenlik Notu: '*' tüm kaynaklara izin verir. MVP için uygundur.
    origins "*"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
