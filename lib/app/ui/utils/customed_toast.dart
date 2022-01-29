import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void buildCustomedToast({
  required String? message,
  required SnackPosition? snackPosition,
  double left = 8,
  double right = 5,
  double bottom = 60,
  TextAlign textAlign = TextAlign.center,
}) =>
    Get.snackbar(
      '',
      '',
      backgroundColor: const Color(0xaa000000),
      // backgroundColor: const Color(2852126720),
      messageText: Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      titleText: Container(),
      snackPosition: snackPosition,
      margin: EdgeInsets.only(
        bottom: bottom,
        left: left,
        right: right,
      ),
      padding: const EdgeInsets.only(bottom: 15, top: 10, left: 8, right: 8),
    );

void customedToast(String message) {
  buildCustomedToast(
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    bottom: 10,
  );
}
