import 'package:flutter/material.dart';

class PilarTextStyle {
  static TextStyle h1({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w700,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle h2({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w600,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle h3({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle h4({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle h5({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle h6({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }

  static TextStyle Label({TextStyle? style}) {
    const defaultStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return defaultStyle.merge(style ?? defaultStyle);
  }
}
