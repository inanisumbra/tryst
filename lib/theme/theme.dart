import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff69596e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff231729),
      onPrimaryContainer: Color(0xff8f7e95),
      secondary: Color(0xff006b56),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff56b79b),
      onSecondaryContainer: Color(0xff004536),
      tertiary: Color(0xff24389c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3f51b5),
      onTertiaryContainer: Color(0xffcacfff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf8fa),
      onSurface: Color(0xff1c1b1d),
      onSurfaceVariant: Color(0xff4a454b),
      outline: Color(0xff7c757c),
      outlineVariant: Color(0xffcdc4cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inversePrimary: Color(0xffd4c0d9),
      primaryFixed: Color(0xfff1dcf5),
      onPrimaryFixed: Color(0xff231729),
      primaryFixedDim: Color(0xffd4c0d9),
      onPrimaryFixedVariant: Color(0xff504256),
      secondaryFixed: Color(0xff94f5d6),
      onSecondaryFixed: Color(0xff002018),
      secondaryFixedDim: Color(0xff78d8bb),
      onSecondaryFixedVariant: Color(0xff005140),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff00105c),
      tertiaryFixedDim: Color(0xffbac3ff),
      onTertiaryFixedVariant: Color(0xff293ca0),
      surfaceDim: Color(0xffddd9db),
      surfaceBright: Color(0xfffdf8fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f4),
      surfaceContainer: Color(0xfff1edee),
      surfaceContainerHigh: Color(0xffebe7e9),
      surfaceContainerHighest: Color(0xffe6e1e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff69596e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff231729),
      onPrimaryContainer: Color(0xffb3a1b8),
      secondary: Color(0xff003e31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff007c63),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff13298f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3f51b5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8fa),
      onSurface: Color(0xff121112),
      onSurfaceVariant: Color(0xff3a343a),
      outline: Color(0xff565157),
      outlineVariant: Color(0xff726b72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inversePrimary: Color(0xffd4c0d9),
      primaryFixed: Color(0xff78687d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5f5064),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff007c63),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00614d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5364c9),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff394baf),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c5c7),
      surfaceBright: Color(0xfffdf8fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f4),
      surfaceContainer: Color(0xffebe7e9),
      surfaceContainerHigh: Color(0xffe0dcdd),
      surfaceContainerHighest: Color(0xffd5d0d2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff69596e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff231729),
      onPrimaryContainer: Color(0xffdecae3),
      secondary: Color(0xff003327),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005442),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff001b86),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2c3fa3),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8fa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2f2b30),
      outlineVariant: Color(0xff4d474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inversePrimary: Color(0xffd4c0d9),
      primaryFixed: Color(0xff534458),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3b2e41),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005442),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a2d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2c3fa3),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0d248c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8ba),
      surfaceBright: Color(0xfffdf8fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4eff1),
      surfaceContainer: Color(0xffe6e1e3),
      surfaceContainerHigh: Color(0xffd7d3d5),
      surfaceContainerHighest: Color(0xffc9c5c7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF2C2F3E),
      surfaceTint: Color(0xffd4c0d9),
      onPrimary: Color(0xff392c3f),
      primaryContainer: Color(0xff120718),
      onPrimaryContainer: Color(0xff85748b),
      secondary: Color(0xffF93066),
      onSecondary: Color(0xff00382b),
      secondaryContainer: Color(0xff56b79b),
      onSecondaryContainer: Color(0xff004536),
      tertiary: Color.fromARGB(255, 210, 225, 247),
      onTertiary: Color(0xff08218a),
      tertiaryContainer: Color(0xff3f51b5),
      onTertiaryContainer: Color(0xffcacfff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141315),
      onSurface: Color(0xffe6e1e3),
      onSurfaceVariant: Color(0xffcdc4cb),
      outline: Color(0xff968e95),
      outlineVariant: Color(0xff4a454b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e3),
      inversePrimary: Color(0xff69596e),
      primaryFixed: Color(0xfff1dcf5),
      onPrimaryFixed: Color(0xff231729),
      primaryFixedDim: Color(0xffd4c0d9),
      onPrimaryFixedVariant: Color(0xff504256),
      secondaryFixed: Color(0xff94f5d6),
      onSecondaryFixed: Color(0xff002018),
      secondaryFixedDim: Color(0xff78d8bb),
      onSecondaryFixedVariant: Color(0xff005140),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff00105c),
      tertiaryFixedDim: Color(0xffbac3ff),
      onTertiaryFixedVariant: Color(0xff293ca0),
      surfaceDim: Color(0xff141315),
      surfaceBright: Color(0xff3a393a),
      surfaceContainerLowest: Color(0xff0f0e0f),
      surfaceContainerLow: Color(0xff1c1b1d),
      surfaceContainer: Color(0xff201f21),
      surfaceContainerHigh: Color(0xff2b292b),
      surfaceContainerHighest: Color(0xff363436),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffead6ef),
      surfaceTint: Color(0xffd4c0d9),
      onPrimary: Color(0xff2e2133),
      primaryContainer: Color(0xff9c8ba2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff8eeed0),
      onSecondary: Color(0xff002c21),
      secondaryContainer: Color(0xff56b79b),
      onSecondaryContainer: Color(0xff002018),
      tertiary: Color(0xffd6daff),
      onTertiary: Color(0xff001775),
      tertiaryContainer: Color(0xff7789f0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe3dae1),
      outline: Color(0xffb8afb7),
      outlineVariant: Color(0xff958e95),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e3),
      inversePrimary: Color(0xff514357),
      primaryFixed: Color(0xfff1dcf5),
      onPrimaryFixed: Color(0xff180c1e),
      primaryFixedDim: Color(0xffd4c0d9),
      onPrimaryFixedVariant: Color(0xff3f3145),
      secondaryFixed: Color(0xff94f5d6),
      onSecondaryFixed: Color(0xff00150f),
      secondaryFixedDim: Color(0xff78d8bb),
      onSecondaryFixedVariant: Color(0xff003e31),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff000841),
      tertiaryFixedDim: Color(0xffbac3ff),
      onTertiaryFixedVariant: Color(0xff13298f),
      surfaceDim: Color(0xff141315),
      surfaceBright: Color(0xff464446),
      surfaceContainerLowest: Color(0xff080708),
      surfaceContainerLow: Color(0xff1e1d1f),
      surfaceContainer: Color(0xff292729),
      surfaceContainerHigh: Color(0xff333234),
      surfaceContainerHighest: Color(0xff3f3d3f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffceaff),
      surfaceTint: Color(0xffd4c0d9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd0bcd5),
      onPrimaryContainer: Color(0xff120718),
      secondary: Color(0xffb5ffe5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff74d4b7),
      onSecondaryContainer: Color(0xff000e09),
      tertiary: Color(0xffefeeff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb5bfff),
      onTertiaryContainer: Color(0xff000532),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff7edf5),
      outlineVariant: Color(0xffc9c0c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e3),
      inversePrimary: Color(0xff514357),
      primaryFixed: Color(0xfff1dcf5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd4c0d9),
      onPrimaryFixedVariant: Color(0xff180c1e),
      secondaryFixed: Color(0xff94f5d6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff78d8bb),
      onSecondaryFixedVariant: Color(0xff00150f),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbac3ff),
      onTertiaryFixedVariant: Color(0xff000841),
      surfaceDim: Color(0xff141315),
      surfaceBright: Color(0xff514f51),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f21),
      surfaceContainer: Color(0xff313032),
      surfaceContainerHigh: Color(0xff3c3b3d),
      surfaceContainerHighest: Color(0xff484648),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
