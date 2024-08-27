import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarDlabsign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDlabsign({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double paddingValue = constraints.maxWidth > 600 ? 50 : 20;
          double fontSize = constraints.maxWidth > 600 ? 24 : 18;
          double logoHeight = constraints.maxWidth > 600 ? 80 : 60;

          return Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(paddingValue, 70, paddingValue, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: logoHeight,
                  ),
                  const SizedBox(height: 20),
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                      'PREDIKSI DIABETES MENGGUNAKAN METODE FUZZY INFERENCE SYSTEM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.w400,
                        height: 1.21,
                        letterSpacing: 1.20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
