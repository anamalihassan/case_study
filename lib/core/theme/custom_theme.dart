import 'package:flutter/material.dart';

class CustomAppTheme extends ThemeExtension<CustomAppTheme> {
  Color? accent;
  Color? secondaryColor;
  Color? ratingBackgroundColor;
  Color? searchBorderColor;
  Color? textHintColor;
  Color? textBodyColor;

  CustomAppTheme({
    this.accent,
    this.secondaryColor,
    this.ratingBackgroundColor,
    this.searchBorderColor,
    this.textHintColor,
    this.textBodyColor,
  });

  @override
  CustomAppTheme copyWith() {
    return CustomAppTheme(
      accent: accent,
      secondaryColor: secondaryColor,
      ratingBackgroundColor: ratingBackgroundColor,
      searchBorderColor: searchBorderColor,
      textHintColor: textHintColor,
      textBodyColor: textBodyColor,
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
      searchBorderColor: Color.lerp(searchBorderColor, other.searchBorderColor, t),
      textHintColor: Color.lerp(textHintColor, other.textHintColor, t),
      textBodyColor: Color.lerp(textBodyColor, other.textBodyColor, t),
    );
  }
}
