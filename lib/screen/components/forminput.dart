import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const InputField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Text(
          labelText,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFFFAFAFA),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.7,
            letterSpacing: 0.96,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: Color.fromARGB(159, 41, 103, 247),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.96,
              ),
              border: InputBorder.none,
            ),
            style: GoogleFonts.poppins(
              color: const Color(0xFF124DDB),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.2,
              letterSpacing: 0.96,
            ),
          ),
        ),
      ],
    );
  }
}
