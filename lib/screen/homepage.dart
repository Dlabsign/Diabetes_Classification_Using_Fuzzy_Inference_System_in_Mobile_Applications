import 'package:diabetes_app/screen/components/appbar.dart';
import 'package:diabetes_app/screen/components/forminput.dart'; // Import komponen InputField
import 'package:diabetes_app/screen/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final TextEditingController _glukosa = TextEditingController(); // Glukosa
  final TextEditingController _ibm = TextEditingController(); // BMI
  final TextEditingController _usia = TextEditingController(); // Usia
  final TextEditingController _sisilah = TextEditingController(); // Sisilah
  final TextEditingController _insulin = TextEditingController(); // Insulin

  double trimf(List<double> universe, double x) {
    double a = universe[0];
    double b = universe[1];
    double c = universe[2];

    if (x <= a || x >= c) return 0.0;
    if (x >= a && x <= b) return (x - a) / (b - a);
    if (x >= b && x <= c) return (c - x) / (c - b);
    return 0.0;
  }

  double fuzzyRule({
    required double glucose,
    required double bmi,
    required double age,
    required double diabetesPedigree,
    required double insulin,
  }) {
    double glucoseLow = trimf([0, 60, 120], glucose);
    double glucoseHigh = trimf([120, 160, 200], glucose);
    double glucoseMedium = trimf([80, 120, 160], glucose);

    double bmiLow = trimf([0, 15, 30], bmi);
    double bmiHigh = trimf([30, 40, 50], bmi);
    double bmiMedium = trimf([20, 30, 40], bmi);

    double ageYoung = trimf([0, 20, 40], age);
    double ageMiddle = trimf([20, 40, 60], age);
    double ageOld = trimf([40, 60, 100], age);

    double levelHigh =
        [glucoseHigh, bmiHigh, ageOld].reduce((a, b) => a < b ? a : b);
    double levelMedium =
        [glucoseMedium, bmiMedium, ageMiddle].reduce((a, b) => a < b ? a : b);
    double levelLow =
        [glucoseLow, bmiLow, ageYoung].reduce((a, b) => a < b ? a : b);

    double diabetesLevel =
        (levelHigh * 100 + levelMedium * 50 + levelLow * 25) / 100;

    return diabetesLevel;
  }

  void _navigateToResultScreen() {
    try {
      // Ambil nilai dari controller dan ubah menjadi double
      double glucose = double.tryParse(_glukosa.text) ?? 0.0;
      double bmi = double.tryParse(_ibm.text) ?? 0.0;
      double age = double.tryParse(_usia.text) ?? 0.0;
      double diabetesPedigree = double.tryParse(_sisilah.text) ?? 0.0;
      double insulin = double.tryParse(_insulin.text) ?? 0.0;

      // Hitung hasil
      double diabetesLevel = fuzzyRule(
        glucose: glucose,
        bmi: bmi,
        age: age,
        diabetesPedigree: diabetesPedigree,
        insulin: insulin,
      );

      // Mendapatkan kesimpulan
      String getConclusion(double diabetesLevel) {
        if (diabetesLevel < 25) {
          return "Orang ini memiliki risiko rendah terkena diabetes.";
        } else if (diabetesLevel < 50) {
          return "Orang ini memiliki risiko sedang terkena diabetes.";
        } else if (diabetesLevel < 75) {
          return "Orang ini memiliki risiko tinggi terkena diabetes.";
        } else {
          return "Orang ini memiliki risiko sangat tinggi terkena diabetes.";
        }
      }

      String conclusion = getConclusion(diabetesLevel);

      // Navigasi ke halaman hasil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            diabetesLevel: diabetesLevel,
            conclusion: conclusion,
            glucose: glucose,
            bmi: bmi,
            age: age,
            diabetesPedigree: diabetesPedigree,
            insulin: insulin,
          ),
        ),
      );
    } catch (e) {
      // Menampilkan pesan error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF334BE2),
      appBar:
          const AppBarDlabsign(), // Menggunakan custom AppBar yang sudah diperbaiki
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InputField(
                labelText: "Masukkan Kadar Glukosa (0-200)",
                hintText: "misal 120",
                controller: _glukosa,
              ),
              InputField(
                labelText: "Masukkan Indeks Massa Tubuh (0-50)",
                hintText: "misal 25.5",
                controller: _ibm,
              ),
              InputField(
                labelText: "Masukkan Usia (0-100)",
                hintText: "misal 35.5",
                controller: _usia,
              ),
              InputField(
                labelText: "Masukkan Fungsi Sisilah Diabetes (0-2.5)",
                hintText: "misal 1.2",
                controller: _sisilah,
              ),
              InputField(
                labelText: "Masukkan Kadar Insulin (0-1000)",
                hintText: "misal 85",
                controller: _insulin,
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsetsDirectional.only(top: 14),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _navigateToResultScreen,
                  child: Text(
                    'Hitung Hasil',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: const Color(0xFF124DDB), // Warna teks tombol
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
