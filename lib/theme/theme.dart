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

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFE6EAEF),
      surfaceTint: Color(0xFFC0C5D9),
      onPrimary: Color(0xff392c3f),
      primaryContainer: Color(0xff120718),
      onPrimaryContainer: Color(0xff85748b),
      secondary: Color(0xFFD85B7E),
      onSecondary: Color(0xff00382b),
      secondaryContainer: Color(0xff56b79b),
      onSecondaryContainer: Color(0xff004536),
      tertiary: Color.fromARGB(226, 186, 191, 221),
      onTertiary: Color(0xff08218a),
      tertiaryContainer: Color(0xFF565B77),
      onTertiaryContainer: Color(0xffcacfff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xFF2F3342),
      onSurface: Color.fromARGB(255, 208, 212, 250),
      onSurfaceVariant: Color(0xFFBE3C5F),
      outline: Color(0xFF838DCA),
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
      surfaceDim: Color(0xFF2C2F44),
      surfaceBright: Color(0xFF535776),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1c1b1c),
      surfaceContainer: Color.fromARGB(255, 32, 34, 44),
      surfaceContainerHigh: Color(0xFF111214),
      surfaceContainerHighest: Color(0xFF393239),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
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
