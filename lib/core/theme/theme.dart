import "package:flutter/material.dart";

class AppTheme {
  static TextTheme textTheme = appTextTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4CAF50),
      surfaceTint: Color(0xff4CAF50),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290572468),
      onPrimaryContainer: Color(4288795546),
      secondary: Color(0xff8BC34A),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291620260),
      onSecondaryContainer: Color(4279181312),
      tertiary: Color(4282804017),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291227305),
      onTertiaryContainer: Color(4278788352),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294441969),
      onSurface: Color(4279835927),
      onSurfaceVariant: Color(4282534208),
      outline: Color(4285692271),
      outlineVariant: Color(4290955709),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4288795546),
      primaryFixed: Color(4290572468),
      onPrimaryFixed: Color(4278198788),
      primaryFixedDim: Color(0xff7bc171),
      onPrimaryFixedVariant: Color(4280504356),
      secondaryFixed: Color(4291620260),
      onSecondaryFixed: Color(4279181312),
      secondaryFixedDim: Color(4289843594),
      onSecondaryFixedVariant: Color(4281617942),
      tertiaryFixed: Color(4291227305),
      onTertiaryFixed: Color(4278788352),
      tertiaryFixedDim: Color(4289450640),
      onTertiaryFixedVariant: Color(4281290523),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294441969),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293717990),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff4caf50),
      surfaceTint: Color(4288795546),
      onPrimary: Color(0xff282828),
      primaryContainer: Color(4285308008),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(0xffb5d58e),
      onSecondary: Color(4278983168),
      secondaryContainer: Color(4286356057),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289713811),
      onTertiary: Color(4278655744),
      tertiaryContainer: Color(4286028638),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(0xff18181B),
      onSurface: Color(4294573299),
      onSurfaceVariant: Color(4291218881),
      outline: Color(4288587162),
      outlineVariant: Color(4286481787),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4280635685),
      primaryFixed: Color(4290572468),
      onPrimaryFixed: Color(4278195714),
      primaryFixedDim: Color(4288795546),
      onPrimaryFixedVariant: Color(4279320341),
      secondaryFixed: Color(4291620260),
      onSecondaryFixed: Color(4278719488),
      secondaryFixedDim: Color(4289843594),
      onSecondaryFixedVariant: Color(4280564998),
      tertiaryFixed: Color(4291227305),
      onTertiaryFixed: Color(4278523136),
      tertiaryFixedDim: Color(4289450640),
      onTertiaryFixedVariant: Color(4280237323),
      surfaceDim: Color(4279243791),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480752),
    );
  }

  static ThemeData light() {
    return theme(lightScheme());
  }

  static ThemeData dark() {
    return theme(darkScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
        brightness: colorScheme.brightness,
        
        colorScheme: colorScheme,
        iconTheme: IconThemeData(
          color: colorScheme.inversePrimary,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(colorScheme.onPrimary),
          textStyle: WidgetStatePropertyAll<TextStyle>(textTheme.bodyMedium!),
          splashFactory: InkRipple.splashFactory,
          shadowColor:
              WidgetStatePropertyAll<Color>(colorScheme.inversePrimary),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadiusSmall),
          )),
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
        )),
        buttonTheme: ButtonThemeData(
          buttonColor: colorScheme.primary,
          textTheme: ButtonTextTheme.primary,
          colorScheme: colorScheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
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

final class Dimensions {
  // Padding
  static const spaceExtraSmall = 4.0;
  static const spaceSmall = 8.0;
  static const spaceMedium = 16.0;
  static const spaceLarge = 24.0;
  static const spaceExtraLarge = 32.0;
  // Padding
  static const paddingExtraSmall = 4.0;
  static const paddingSmall = 8.0;
  static const paddingMedium = 16.0;
  static const paddingLarge = 24.0;
  static const paddingExtraLarge = 32.0;

  // Margins
  static const marginExtraSmall = 4.0;
  static const marginSmall = 8.0;
  static const marginMedium = 16.0;
  static const marginLarge = 24.0;
  static const marginExtraLarge = 32.0;

  // Font sizes
  static const fontSizeSmall = 12.0;
  static const fontSizeNormal = 14.0;
  static const fontSizeMedium = 16.0;
  static const fontSizeLarge = 20.0;

  // Corner Radius
  static const cornerRadiusExtraSmall = 4.0;
  static const cornerRadiusSmall = 8.0;
  static const cornerRadiusMedium = 16.0;
  static const cornerRadiusLarge = 24.0;
  static const cornerRadiusExtraLarge = 32.0;

  // Other dimensions
  static const buttonHeight = 48.0;
  static const iconSize = 32.0;
  static const elevation = 4.0;
  static const profileImageSize = 160.0;
  static const cardImageHeight = 160.0;
  static const bannerImageHeight = 200.0;
  static const toolBarHeight = 56.0;
}

const TextTheme appTextTheme = TextTheme(
  displaySmall: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w300,
    fontSize: 12.0, // Replace with your small font size
  ),
  displayMedium: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w400,
    fontSize: 14.0, // Replace with your normal font size
  ),
  displayLarge: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w600,
    fontSize: 20.0, // Replace with your large font size
  ),
  headlineSmall: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w600,
    fontSize: 12.0, // Replace with your small font size
  ),
  headlineMedium: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w700,
    fontSize: 16.0, // Replace with your medium font size
  ),
  headlineLarge: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w800,
    fontSize: 20.0, // Replace with your large font size
  ),
  titleSmall: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
  ),
  titleMedium: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  ),
  titleLarge: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  ),
  bodySmall: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeMedium,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  ),
  labelSmall: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w100,
    fontSize: 12.0,
  ),
  labelMedium: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    letterSpacing: 0.5,
  ),
  labelLarge: TextStyle(
    fontFamily: 'IRANYekan',
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
  ),
);
