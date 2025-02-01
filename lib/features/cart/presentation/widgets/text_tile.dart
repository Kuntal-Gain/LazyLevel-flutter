import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget priceTile({required String label, required double val}) {
  return Padding(
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
              textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
        ),
        Text(
          '\$$val',
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
