# Aplikasi Prediksi Risiko Diabetes

Aplikasi Flutter ini dirancang untuk memprediksi tingkat risiko diabetes menggunakan pendekatan logika fuzzy. Aplikasi ini memungkinkan pengguna untuk memasukkan berbagai metrik kesehatan, menghitung tingkat risiko, dan memberikan kesimpulan berdasarkan hasil perhitungan tersebut.

## Fitur

- **Kolom Input**: Pengguna dapat memasukkan kadar Glukosa, BMI, Usia, Fungsi Silsilah Diabetes, dan kadar Insulin.
- **Perhitungan Logika Fuzzy**: Aplikasi menggunakan logika fuzzy untuk menghitung risiko diabetes berdasarkan input yang diberikan.
- **Layar Hasil**: Menampilkan tingkat risiko diabetes yang dihitung dan kesimpulan terkait risiko tersebut.

## Struktur Proyek

Layar utama (`FirstScreen`) mencakup lima kolom input dan sebuah tombol untuk menghitung hasil. Metode `fuzzyRule` mengimplementasikan logika fuzzy untuk mengevaluasi tingkat risiko berdasarkan input pengguna.

### Komponen Utama

- **Custom AppBar (`AppBarDlabsign`)**: Komponen AppBar kustom yang digunakan di seluruh aplikasi.
- **Custom Input Field (`InputField`)**: Komponen kolom input yang dapat digunakan kembali untuk menangkap data pengguna.
- **Layar Hasil (`ResultScreen`)**: Menampilkan tingkat risiko diabetes dan kesimpulan terkait.

### Kolom Input

1. **Kadar Glukosa** (0-200 mg/dL)
2. **BMI** (0-50 kg/m²)
3. **Usia** (0-100 tahun)
4. **Fungsi Silsilah Diabetes** (0-2.5)
5. **Kadar Insulin** (0-1000 µU/mL)

### Implementasi Logika Fuzzy

Sistem logika fuzzy didefinisikan dalam metode `fuzzyRule`. Logika ini mengevaluasi tiga tingkat risiko:

- **Risiko Rendah**
- **Risiko Sedang**
- **Risiko Tinggi**

Tingkat risiko ini dihitung menggunakan fungsi keanggotaan segitiga yang didefinisikan dalam metode `trimf`.

### Navigasi

Aplikasi akan menavigasi dari layar input ke layar hasil menggunakan `Navigator.push`, dengan melewatkan tingkat risiko yang dihitung dan input pengguna ke `ResultScreen`.

## Memulai

### Prasyarat

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Google Fonts](https://pub.dev/packages/google_fonts)

### Instalasi

1. Clone repository ini:

    ```bash
    git clone https://github.com/your-username/diabetes-risk-app.git
    cd diabetes-risk-app
    ```

2. Instal dependensi:

    ```bash
    flutter pub get
    ```

3. Jalankan aplikasi:

    ```bash
    flutter run
    ```

## Penggunaan

1. Buka aplikasi.
2. Masukkan metrik kesehatan yang diperlukan dalam kolom input yang tersedia.
3. Tekan tombol "Hitung Hasil" untuk menghitung risiko diabetes Anda.
4. Lihat hasilnya di layar berikutnya.

## Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.
