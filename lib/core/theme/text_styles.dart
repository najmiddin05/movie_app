// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {
  final TextStyle poppinsRegular8;
  final TextStyle poppinsRegular9;
  final TextStyle poppinsRegular10;
  final TextStyle poppinsRegular12;
  final TextStyle poppinsRegular14;
  final TextStyle poppinsRegular16;
  final TextStyle poppinsRegular24;
  final TextStyle poppinsMedium8;
  final TextStyle poppinsMedium10;
  final TextStyle poppinsMedium12;
  final TextStyle poppinsMedium14;
  final TextStyle poppinsMedium15;
  final TextStyle poppinsMedium16;
  final TextStyle poppinsMedium18;
  final TextStyle poppinsMedium20;
  final TextStyle poppinsMedium24;
  final TextStyle poppinsMedium32;

  final TextStyle poppinsSemiBold10;
  final TextStyle poppinsSemiBold12;
  final TextStyle poppinsSemiBold14;
  final TextStyle poppinsSemiBold16;
  final TextStyle poppinsSemiBold18;
  final TextStyle poppinsSemiBold20;
  final TextStyle poppinsSemiBold22;
  final TextStyle poppinsSemiBold30;

  final TextStyle poppinsBold8;
  final TextStyle poppinsBold10;
  final TextStyle poppinsBold12;
  final TextStyle poppinsBold14;
  final TextStyle poppinsBold16;
  final TextStyle poppinsBold80;

  const TextStyles({
    required this.poppinsRegular8,
    required this.poppinsRegular9,
    required this.poppinsRegular10,
    required this.poppinsRegular12,
    required this.poppinsRegular14,
    required this.poppinsRegular16,
    required this.poppinsRegular24,
    required this.poppinsMedium8,
    required this.poppinsMedium10,
    required this.poppinsMedium12,
    required this.poppinsMedium14,
    required this.poppinsMedium15,
    required this.poppinsMedium16,
    required this.poppinsMedium18,
    required this.poppinsMedium20,
    required this.poppinsMedium24,
    required this.poppinsMedium32,
    required this.poppinsSemiBold10,
    required this.poppinsSemiBold12,
    required this.poppinsSemiBold14,
    required this.poppinsSemiBold16,
    required this.poppinsSemiBold18,
    required this.poppinsSemiBold20,
    required this.poppinsSemiBold22,
    required this.poppinsSemiBold30,
    required this.poppinsBold8,
    required this.poppinsBold10,
    required this.poppinsBold12,
    required this.poppinsBold14,
    required this.poppinsBold16,
    required this.poppinsBold80,
  });

  static TextStyles textStyles = TextStyles(
    poppinsRegular8: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular9: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular10: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular12: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular14: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular16: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsRegular24: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
    poppinsMedium8: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium10: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium12: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium14: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium15: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium16: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium18: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium20: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium24: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsMedium32: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold10: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold12: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold14: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold16: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold18: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold20: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold22: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsSemiBold30: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600, fontFamily: FontFamily.poppins.name),
    poppinsBold8: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold, fontFamily: FontFamily.poppins.name),
    poppinsBold10: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, fontFamily: FontFamily.poppins.name),
    poppinsBold12: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: FontFamily.poppins.name),
    poppinsBold14: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: FontFamily.poppins.name),
    poppinsBold16: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.poppins.name,
    ),
    poppinsBold80: TextStyle(
      color: Colors.black,
      fontSize: 80,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.poppins.name,
    ),
  );

  @override
  TextStyles copyWith({
    TextStyle? poppinsRegular8,
    TextStyle? poppinsRegular9,
    TextStyle? poppinsRegular10,
    TextStyle? poppinsRegular12,
    TextStyle? poppinsRegular14,
    TextStyle? poppinsRegular16,
    TextStyle? poppinsRegular24,
    TextStyle? poppinsMedium8,
    TextStyle? poppinsMedium10,
    TextStyle? poppinsMedium12,
    TextStyle? poppinsMedium14,
    TextStyle? poppinsMedium15,
    TextStyle? poppinsMedium16,
    TextStyle? poppinsMedium18,
    TextStyle? poppinsMedium20,
    TextStyle? poppinsMedium24,
    TextStyle? poppinsMedium32,
    TextStyle? poppinsSemiBold10,
    TextStyle? poppinsSemiBold12,
    TextStyle? poppinsSemiBold14,
    TextStyle? poppinsSemiBold16,
    TextStyle? poppinsSemiBold18,
    TextStyle? poppinsSemiBold20,
    TextStyle? poppinsSemiBold22,
    TextStyle? poppinsSemiBold30,
    TextStyle? poppinsBold8,
    TextStyle? poppinsBold10,
    TextStyle? poppinsBold12,
    TextStyle? poppinsBold14,
    TextStyle? poppinsBold16,
    TextStyle? poppinsBold80,
  }) =>
      TextStyles(
        poppinsRegular8: poppinsRegular8 ?? this.poppinsRegular8,
        poppinsRegular9: poppinsRegular9 ?? this.poppinsRegular9,
        poppinsRegular10: poppinsRegular10 ?? this.poppinsRegular10,
        poppinsRegular12: poppinsRegular12 ?? this.poppinsRegular12,
        poppinsRegular14: poppinsRegular14 ?? this.poppinsRegular14,
        poppinsRegular16: poppinsRegular16 ?? this.poppinsRegular16,
        poppinsRegular24: poppinsRegular24 ?? this.poppinsRegular24,
        poppinsMedium8: poppinsMedium8 ?? this.poppinsMedium8,
        poppinsMedium10: poppinsMedium10 ?? this.poppinsMedium10,
        poppinsMedium12: poppinsMedium12 ?? this.poppinsMedium12,
        poppinsMedium14: poppinsMedium14 ?? this.poppinsMedium14,
        poppinsMedium15: poppinsMedium15 ?? this.poppinsMedium15,
        poppinsMedium16: poppinsMedium16 ?? this.poppinsMedium16,
        poppinsMedium18: poppinsMedium18 ?? this.poppinsMedium18,
        poppinsMedium20: poppinsMedium20 ?? this.poppinsMedium20,
        poppinsMedium24: poppinsMedium24 ?? this.poppinsMedium24,
        poppinsMedium32: poppinsMedium32 ?? this.poppinsMedium32,
        poppinsSemiBold10: poppinsSemiBold10 ?? this.poppinsSemiBold10,
        poppinsSemiBold12: poppinsSemiBold12 ?? this.poppinsSemiBold12,
        poppinsSemiBold14: poppinsSemiBold14 ?? this.poppinsSemiBold14,
        poppinsSemiBold16: poppinsSemiBold16 ?? this.poppinsSemiBold16,
        poppinsSemiBold18: poppinsSemiBold18 ?? this.poppinsSemiBold18,
        poppinsSemiBold20: poppinsSemiBold20 ?? this.poppinsSemiBold20,
        poppinsSemiBold22: poppinsSemiBold22 ?? this.poppinsSemiBold22,
        poppinsSemiBold30: poppinsSemiBold30 ?? this.poppinsSemiBold30,
        poppinsBold8: poppinsBold8 ?? this.poppinsBold8,
        poppinsBold10: poppinsBold10 ?? this.poppinsBold10,
        poppinsBold12: poppinsBold12 ?? this.poppinsBold12,
        poppinsBold14: poppinsBold14 ?? this.poppinsBold14,
        poppinsBold16: poppinsBold16 ?? this.poppinsBold16,
        poppinsBold80: poppinsBold80 ?? this.poppinsBold80,
      );

  @override
  ThemeExtension<TextStyles> lerp(ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) {
      return this;
    }
    return TextStyles(
      poppinsRegular8: TextStyle.lerp(poppinsRegular8, other.poppinsRegular8, t)!,
      poppinsRegular9: TextStyle.lerp(poppinsRegular9, other.poppinsRegular9, t)!,
      poppinsRegular10: TextStyle.lerp(poppinsRegular10, other.poppinsRegular10, t)!,
      poppinsRegular12: TextStyle.lerp(poppinsRegular12, other.poppinsRegular12, t)!,
      poppinsRegular14: TextStyle.lerp(poppinsRegular14, other.poppinsRegular14, t)!,
      poppinsRegular16: TextStyle.lerp(poppinsRegular16, other.poppinsRegular16, t)!,
      poppinsRegular24: TextStyle.lerp(poppinsRegular24, other.poppinsRegular24, t)!,
      poppinsMedium8: TextStyle.lerp(poppinsMedium8, other.poppinsMedium8, t)!,
      poppinsMedium10: TextStyle.lerp(poppinsMedium10, other.poppinsMedium10, t)!,
      poppinsMedium12: TextStyle.lerp(poppinsMedium12, other.poppinsMedium12, t)!,
      poppinsMedium14: TextStyle.lerp(poppinsMedium14, other.poppinsMedium14, t)!,
      poppinsMedium15: TextStyle.lerp(poppinsMedium15, other.poppinsMedium15, t)!,
      poppinsMedium16: TextStyle.lerp(poppinsMedium16, other.poppinsMedium16, t)!,
      poppinsMedium18: TextStyle.lerp(poppinsMedium18, other.poppinsMedium18, t)!,
      poppinsMedium20: TextStyle.lerp(poppinsMedium20, other.poppinsMedium20, t)!,
      poppinsMedium24: TextStyle.lerp(poppinsMedium24, other.poppinsMedium24, t)!,
      poppinsMedium32: TextStyle.lerp(poppinsMedium32, other.poppinsMedium32, t)!,
      poppinsSemiBold10: TextStyle.lerp(poppinsSemiBold10, other.poppinsSemiBold10, t)!,
      poppinsSemiBold12: TextStyle.lerp(poppinsSemiBold12, other.poppinsSemiBold12, t)!,
      poppinsSemiBold14: TextStyle.lerp(poppinsSemiBold14, other.poppinsSemiBold14, t)!,
      poppinsSemiBold16: TextStyle.lerp(poppinsSemiBold16, other.poppinsSemiBold16, t)!,
      poppinsSemiBold18: TextStyle.lerp(poppinsSemiBold18, other.poppinsSemiBold18, t)!,
      poppinsSemiBold20: TextStyle.lerp(poppinsSemiBold20, other.poppinsSemiBold20, t)!,
      poppinsSemiBold22: TextStyle.lerp(poppinsSemiBold22, other.poppinsSemiBold22, t)!,
      poppinsSemiBold30: TextStyle.lerp(poppinsSemiBold30, other.poppinsSemiBold30, t)!,
      poppinsBold8: TextStyle.lerp(poppinsBold8, other.poppinsBold8, t)!,
      poppinsBold10: TextStyle.lerp(poppinsBold10, other.poppinsBold10, t)!,
      poppinsBold12: TextStyle.lerp(poppinsBold12, other.poppinsBold12, t)!,
      poppinsBold14: TextStyle.lerp(poppinsBold14, other.poppinsBold14, t)!,
      poppinsBold16: TextStyle.lerp(poppinsBold16, other.poppinsBold16, t)!,
      poppinsBold80: TextStyle.lerp(poppinsBold80, other.poppinsBold80, t)!,
    );
  }
}

enum FontFamily {
  poppins,
}
