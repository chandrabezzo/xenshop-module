import 'package:flutter/material.dart';

class XenshopTextStyle extends TextStyle {
  static TextStyle? overline({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.overline?.copyWith(
        color: color,
        decoration: decoration,
        fontWeight: fontWeight,
      );
  }

  static TextStyle? caption({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.caption?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? button({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.button?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? bodyText2({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.bodyText2?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? bodyText1({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? subtitle2({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.subtitle2?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? subtitle1({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.subtitle1?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline6({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline6?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline5({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline5?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline4({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline4?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline3({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline3?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline2({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline2?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }

  static TextStyle? headline1({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    return Theme.of(context).textTheme.headline1?.copyWith(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
        );
  }
}