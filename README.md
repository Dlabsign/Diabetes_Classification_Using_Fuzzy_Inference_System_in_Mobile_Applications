# Aplikasi Prediksi Risiko Diabetes
Aplikasi Flutter ini dirancang untuk memprediksi tingkat risiko diabetes menggunakan pendekatan logika fuzzy. Aplikasi ini memungkinkan pengguna untuk memasukkan berbagai metrik kesehatan, menghitung tingkat risiko, dan memberikan kesimpulan berdasarkan hasil perhitungan tersebut.

Fitur
Kolom Input: Pengguna dapat memasukkan kadar Glukosa, BMI, Usia, Fungsi Silsilah Diabetes, dan kadar Insulin.
Perhitungan Logika Fuzzy: Aplikasi menggunakan logika fuzzy untuk menghitung risiko diabetes berdasarkan input yang diberikan.
Layar Hasil: Menampilkan tingkat risiko diabetes yang dihitung dan kesimpulan terkait risiko tersebut.
Struktur Proyek
Layar utama (FirstScreen) mencakup lima kolom input dan sebuah tombol untuk menghitung hasil. Metode fuzzyRule mengimplementasikan logika fuzzy untuk mengevaluasi tingkat risiko berdasarkan input pengguna.

Komponen Utama
Custom AppBar (AppBarDlabsign): Komponen AppBar kustom yang digunakan di seluruh aplikasi.
Custom Input Field (InputField): Komponen kolom input yang dapat digunakan kembali untuk menangkap data pengguna.
Layar Hasil (ResultScreen): Menampilkan tingkat risiko diabetes dan kesimpulan terkait.
Kolom Input
Kadar Glukosa (0-200 mg/dL)
BMI (0-50 kg/m²)
Usia (0-100 tahun)
Fungsi Silsilah Diabetes (0-2.5)
Kadar Insulin (0-1000 µU/mL)
Implementasi Logika Fuzzy
Sistem logika fuzzy didefinisikan dalam metode fuzzyRule. Logika ini mengevaluasi tiga tingkat risiko:

Risiko Rendah
Risiko Sedang
Risiko Tinggi
Tingkat risiko ini dihitung menggunakan fungsi keanggotaan segitiga yang didefinisikan dalam metode trimf.

Navigasi
Aplikasi akan menavigasi dari layar input ke layar hasil menggunakan Navigator.push, dengan melewatkan tingkat risiko yang dihitung dan input pengguna ke ResultScreen.

Memulai
Prasyarat
Flutter SDK
Google Fonts
Instalasi
Clone repository ini:

bash
Salin kode
git clone https://github.com/your-username/diabetes-risk-app.git
cd diabetes-risk-app
Instal dependensi:

bash
Salin kode
flutter pub get
Jalankan aplikasi:

bash
Salin kode
flutter run
Penggunaan
Buka aplikasi.
Masukkan metrik kesehatan yang diperlukan dalam kolom input yang tersedia.
Tekan tombol "Hitung Hasil" untuk menghitung risiko diabetes Anda.
Lihat hasilnya di layar berikutnya.
Lisensi
Proyek ini dilisensikan di bawah Lisensi MIT - lihat file LICENSE untuk detail lebih lanjut.

Silakan sesuaikan konten dan bagian README sesuai kebutuhan spesifik proyek Anda.








