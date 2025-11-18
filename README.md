# Soulingo API

Soulingo, kişiselleştirilmiş dil öğrenimi sağlayan, AI tabanlı video üretim yeteneklerine sahip bir MVP (Minimum Viable Product) projesidir. Bu repo, uygulamanın RESTful backend servislerini içerir.

Proje, Ruby on Rails 7.1.3 (API Mode) üzerinde geliştirilmiştir ve SQLite veritabanı kullanmaktadır.

## 🛠 Teknik Altyapı (Stack)

- **Dil:** Ruby 3.4.7
- **Framework:** Rails 7.1.3 (API Only)
- **Veritabanı:** SQLite3 (~> 1.7.3 - Windows uyumluluğu için optimize edildi)
- **Kimlik Doğrulama:** JWT (JSON Web Token)
- **HTTP Client:** Faraday
- **AI Entegrasyonları:**
  - **D-ID:** Avatar video üretimi için (Şu an Mock modunda)
  - **ElevenLabs:** Ses sentezi için (Mimari olarak tanımlı)

## 🚀 Kurulum

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyin.

### 1. Depoyu Klonlayın

```bash
git clone https://github.com/KULLANICI_ADINIZ/soulingo-api.git
cd soulingo-api
```

### 2. Bağımlılıkları Yükleyin

```bash
bundle install
```

### 3. Veritabanı Kurulumu

Veritabanını oluşturun, tabloları migrate edin ve test verilerini (seed) yükleyin.

```bash
ruby bin/rails db:migrate
ruby bin/rails db:seed
```

> **Not:** `db:seed` komutu bir adet test kullanıcısı, kurs ve ders oluşturacaktır.

### 4. Sunucuyu Başlatın

```bash
ruby bin/rails server
```

Sunucu `http://localhost:3000` adresinde çalışmaya başlayacaktır.

## 🔌 API Dokümantasyonu

Tüm isteklerde (Login hariç) `Authorization` header'ında `Bearer <TOKEN>` gönderilmelidir.

### Kimlik Doğrulama (Auth)

| Method | Endpoint              | Açıklama                      | Body                                      |
|--------|-----------------------|-------------------------------|-------------------------------------------|
| `POST` | `/api/v1/auth/login`  | Kullanıcı girişi ve Token alma | `{ "email": "...", "password": "..." }`   |

**Test Kullanıcısı:**
- Email: `test@soulingo.com`
- Password: `password123`

### Kurslar (Courses)

| Method | Endpoint                | Açıklama                                    |
|--------|-------------------------|---------------------------------------------|
| `GET`  | `/api/v1/courses`       | Tüm kursları listeler                       |
| `GET`  | `/api/v1/courses/:id`   | Kurs detayını ve bağlı dersleri getirir     |

### Dersler ve AI Video (Lessons)

| Method | Endpoint                      | Açıklama                                                    |
|--------|-------------------------------|-------------------------------------------------------------|
| `GET`  | `/api/v1/lessons/:id`         | Ders içeriğini ve varsa video durumunu getirir              |
| `POST` | `/api/v1/lessons/:id/generate`| D-ID servisini tetikler (Şu an Mock Modu aktiftir)          |

## ⚙️ Konfigürasyon ve Servisler

### D-ID Entegrasyonu (Mock Mode)

Proje şu anda geliştirme aşamasında olduğu için, `LessonsController` içerisindeki `generate_video` metodu **Mock Mode (Taklit Modu)** olarak çalışmaktadır. Gerçek API çağrısı yapmadan başarılı bir yanıt simüle eder ve veritabanına kayıt atar.
