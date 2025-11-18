# Önce temizlik yapalım
VideoGeneration.destroy_all
Lesson.destroy_all
Course.destroy_all
User.destroy_all

puts "Eski veriler temizlendi."

# 1. Kullanıcı Oluştur
user = User.create!(
  name: "Test User",
  email: "test@soulingo.com",
  password: "password123"
)
puts "Kullanıcı oluşturuldu: test@soulingo.com / password123"

# 2. Kurs Oluştur
course = Course.create!(
  title: "Business English - A1",
  level: "Beginner",
  description: "İş hayatına giriş için temel İngilizce kalıpları."
)
puts "Kurs oluşturuldu: #{course.title}"

# 3. Ders Oluştur
lesson = Lesson.create!(
  course: course,
  title: "Tanışma ve Selamlaşma",
  subject: "Meeting new people",
  content: "Hello, my name is John. Nice to meet you. I work at Soulingo as a developer."
)
puts "Ders oluşturuldu: #{lesson.title}"

puts "Seed işlemi tamamlandı!"