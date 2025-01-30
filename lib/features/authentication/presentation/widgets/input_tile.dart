import 'package:flutter/material.dart';

Widget inputTile({
  required TextEditingController controller,
  required String hintText,
  required Size mq,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    padding: EdgeInsets.all(12),
    width: mq.width,
    height: mq.height * 0.08,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Colors.white,
      border: Border.all(color: Color(0xffc2c2c2)),
      // boxShadow: [
      //   BoxShadow(
      //     color: Color(0xffc2c2c2),
      //     spreadRadius: 2,
      //     blurRadius: 2,
      //     offset: Offset(-5, 5),
      //   ),
      // ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}

Widget inputPassTile({
  required TextEditingController controller,
  required String hintText,
  required Size mq,
  required bool obscureText,
  required VoidCallback showPassword,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    padding: EdgeInsets.all(12),
    width: mq.width,
    height: mq.height * 0.08,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Colors.white,
      border: Border.all(color: Color(0xffc2c2c2)),
      // boxShadow: [
      //   BoxShadow(
      //     color: Color(0xffc2c2c2),
      //     spreadRadius: 2,
      //     blurRadius: 2,
      //     offset: Offset(-5, 5),
      //   ),
      // ],
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller, // Add controller
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),

        // Show password button
        IconButton(
          onPressed: showPassword, // Direct callback
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
