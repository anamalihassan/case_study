import 'package:flutter/material.dart';

class CustomAppTheme extends ThemeExtension<CustomAppTheme> {
  Color? accent;
  Color? secondaryColor;
  Color? ratingBackgroundColor;

  CustomAppTheme({
    this.accent,
    this.secondaryColor,
    this.ratingBackgroundColor,
  });

  @override
  CustomAppTheme copyWith() {
    return CustomAppTheme(
      accent: accent,
      secondaryColor: secondaryColor,
      ratingBackgroundColor: ratingBackgroundColor,
    );
  }

  @override
  CustomAppTheme lerp(ThemeExtension<CustomAppTheme>? other, double t) {
    if (other is! CustomAppTheme) {
      return this;
    }
    return CustomAppTheme(
      accent: Color.lerp(accent, other.accent, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      ratingBackgroundColor: Color.lerp(ratingBackgroundColor, other.ratingBackgroundColor, t),
    );
  }
}
