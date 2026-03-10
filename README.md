# 🌦️ WeatherApp - Türkiye Hava Durumu Uygulaması

**WeatherApp**, Türkiye'nin 81 ili ve tüm ilçeleri için anlık hava durumu verilerini sunan, modern ve performans odaklı bir Flutter uygulamasıdır. Meteoroloji Genel Müdürlüğü (MGM) servislerini kullanarak en doğru ve güncel verileri kullanıcıya ulaştırır.

## 🚀 Öne Çıkan Özellikler

* **Anlık Veri Erişimi:** MGM API üzerinden çekilen gerçek zamanlı sıcaklık ve hava durumu bilgileri.

* **Kapsamlı Konum Desteği:** Türkiye'deki tüm il ve ilçeleri içeren detaylı yerel veritabanı.

* **Dinamik Görselleştirme:** Hava durumuna göre dinamik olarak değişen SVG ikonlar ve temalar.

* **Gelişmiş State Yönetimi:** Uygulama genelinde veri tutarlılığı için **Riverpod** kullanımı.

* **Kullanıcı Dostu Arayüz:** Modern "Bottom Sheet" tasarımı ile kolay il/ilçe seçimi.

## 🛠️ Kullanılan Teknolojiler

* **Framework:** Flutter

* **State Management:** Riverpod

* **Ağ İletişimi:** Http (REST API)

* **Vektörel Grafikler:** Flutter SVG

* **Veri Kaynağı:** Meteoroloji Genel Müdürlüğü (MGM) API

## 📂 Proje Yapısı

```
lib/
├── database/         # Türkiye il ve ilçe listesi.
├── providers/        # StateNotifier ve FutureProvider tanımları.
│   ├── LocationProvider.dart  # Konum yönetimi.
│   └── WeatherProvider.dart   # Hava durumu verisi işleme.
├── services/         # API servis katmanı.
├── views/            # UI bileşenleri ve sayfalar.
└── main.dart         # Giriş noktası.
```

## ⚙️ Kurulum ve Çalıştırma

1. **Depoyu klonlayın:**

   ```
   git clone [https://github.com/muhammedkizildag/weatherapp.git](https://github.com/muhammedkizildag/weatherapp.git)
   ```

2. **Bağımlılıkları yükleyin:**

   ```
   flutter pub get
   ```

3. **Uygulamayı çalıştırın:**

   ```
   flutter run
   ```

## 📸 Uygulama Önizlemesi



https://github.com/user-attachments/assets/df5fc9db-e60a-4e7d-a3ec-3cfbf50d45c8



## 📝 Lisans ve Katkıda Bulunma

Bu proje açık kaynaklıdır. Her türlü hata bildirimi veya geliştirme talebi için lütfen bir **Issue** oluşturun.

**Geliştirici:** [Muhammed Kızıldağ](https://github.com/muhammedkizildag)

**Lisans:** MIT
