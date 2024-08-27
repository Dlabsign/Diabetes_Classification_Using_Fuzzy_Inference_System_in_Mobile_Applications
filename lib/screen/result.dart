import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diabetes_app/screen/components/appbar.dart';

class ResultScreen extends StatelessWidget {
  final double diabetesLevel;
  final String conclusion;
  final double glucose;
  final double bmi;
  final double age;
  final double diabetesPedigree;
  final double insulin;

  const ResultScreen({
    super.key,
    required this.diabetesLevel,
    required this.conclusion,
    required this.glucose,
    required this.bmi,
    required this.age,
    required this.diabetesPedigree,
    required this.insulin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF334BE2),
      appBar: const AppBarDlabsign(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = constraints.maxWidth > 600 ? 40 : 25;
          double titleFontSize = constraints.maxWidth > 600 ? 28 : 24;
          double dataFontSize = constraints.maxWidth > 600 ? 30 : 26;
          double labelFontSize = constraints.maxWidth > 600 ? 20 : 18;

          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 35, horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.only(bottom: 3),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tingkat Diabetes: ${diabetesLevel.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: titleFontSize,
                            letterSpacing: 1.1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          conclusion,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.6,
                            letterSpacing: 1.1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildDataRow('GLUKOSA', glucose.toStringAsFixed(1),
                      labelFontSize, dataFontSize),
                  const SizedBox(height: 15),
                  _buildDataRow('BMI', bmi.toStringAsFixed(1), labelFontSize,
                      dataFontSize),
                  const SizedBox(height: 15),
                  _buildDataRow('Age', age.toStringAsFixed(0), labelFontSize,
                      dataFontSize),
                  const SizedBox(height: 15),
                  _buildDataRow(
                      'Diabetes Pedigree',
                      diabetesPedigree.toStringAsFixed(2),
                      labelFontSize,
                      dataFontSize),
                  const SizedBox(height: 15),
                  _buildDataRow('Insulin', insulin.toStringAsFixed(2),
                      labelFontSize, dataFontSize),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDataRow(
      String label, String value, double labelFontSize, double dataFontSize) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: const Color.fromARGB(145, 255, 255, 255), width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0.90,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: const Color(0xFFECEDF5),
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.14,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: dataFontSize,
              fontWeight: FontWeight.w300,
              letterSpacing: 2.24,
            ),
          ),
        ],
      ),
    );
  }
}
