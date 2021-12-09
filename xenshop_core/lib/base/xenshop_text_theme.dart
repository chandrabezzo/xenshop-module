import 'package:flutter/material.dart';
import 'colors.dart';

class XenshopTextTheme extends TextTheme {
  @override
  TextStyle? get overline => const TextStyle(
    color: black,
    fontSize: 10,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle? get caption => const TextStyle(
    color: black,
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle? get button => const TextStyle(
    color: black,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle? get bodyText2 => const TextStyle(
    color: black,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle? get bodyText1 => const TextStyle(
    color: black,
    fontSize: 15,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get subtitle2 => const TextStyle(
    color: black,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle? get subtitle1 => const TextStyle(
    color: black,
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get headline6 => const TextStyle(
    color: black,
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle? get headline5 => const TextStyle(
    color: black,
    fontSize: 20,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get headline4 => const TextStyle(
    color: black,
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get headline3 => const TextStyle(
    color: black,
    fontSize: 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get headline2 => const TextStyle(
    color: black,
    fontSize: 32,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get headline1 => const TextStyle(
    color: black,
    fontSize: 40,
    letterSpacing: -1.5,
    fontWeight: FontWeight.w600,
  );
}