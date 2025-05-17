import "package:flutter/material.dart";

class AppTheme {
  static TextTheme textTheme = appTextTheme;
  static const Color primary = Color(0xFF169056);

  // Tints (lighter versions)
  static const Color primaryLight1 = Color(0xFFD5EDE0);
  static const Color primaryLight2 = Color(0xFFE6F4EB);
  static const Color primaryLight3 = Color(0xFFF2F9F5);
  static const Color primaryLight4 = Color(0xFFF8FCFA);
  static const Color primaryLight5 = Color(0xFFFCFEFD);

  ///
  static const Color primaryLight6 = Color(0xFF6F6F6F);
  // Shades (darker versions)
  static const Color primaryDark1 = Color(0xFF127D4C);
  static const Color primaryDark2 = Color(0xFF0E6A41);
  static const Color primaryDark3 = Color(0xFF0A5836);
  static const Color primaryDark4 = Color(0xFF07452B);

  // Define a common text theme

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w600,
      fontSize: 20.0, // Replace with your large font size
    ),
    headlineSmall: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w600,
      fontSize: 12.0, // Replace with your small font size
    ),
    headlineMedium: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w700,
      fontSize: 16.0, // Replace with your medium font size
    ),
    displaySmall: TextStyle(
      fontFamily: 'IRL',
      fontWeight: FontWeight.w300,
      fontSize: 24.0, // Replace with your small font size
    ),
    displayMedium: TextStyle(
      fontFamily: 'IRM',
      fontWeight: FontWeight.w400,
      fontSize: 28.0, // Replace with your normal font size
    ),
    titleLarge: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
    ),
    titleMedium: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),
    titleSmall: TextStyle(
      fontFamily: 'IRB',
      fontWeight: FontWeight.w700,
      fontSize: 14.0,
    ),
    bodySmall: TextStyle(
      fontFamily: 'IRL',
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'IRM',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'IRR',
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    labelSmall: TextStyle(
      fontFamily: 'IRL',
      fontWeight: FontWeight.w100,
      fontSize: 12.0,
    ),
    labelMedium: TextStyle(
      fontFamily: 'IRM',
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      letterSpacing: 0.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'IRM',
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
    ),
  );
  // Light Theme
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF169056), // New primary color
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xFFD5EDE0),
      onPrimaryContainer: Color(0xFF07452B),

      // Secondary Colors (complementary to green)
      secondary: Color(0xFF168A7A), // Teal green
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xFFD0F0EB),
      onSecondaryContainer: Color(0xFF073D35),

      // Tertiary Colors (accent color)
      tertiary: Color(0xFF6A8F16), // Olive green
      onTertiary: Color(0xFF1F2607),
      tertiaryContainer: Color(0xFFE5F2D0),
      onTertiaryContainer: Color(0xFF172407),

      error: Color(0xffd32f2f),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffe0e0),
      onErrorContainer: Color(0xff7f0000),

      surface: Color(0xFFD5EDE0), // Light greenish white
      onSurface: Color(0xff242924),
      onSurfaceVariant: Color(0xff5a635a),
      outline: Color(0xff8e9e8e),

      inverseSurface: Color(0xff323E32),
      inversePrimary: Color(0xFF169056),

      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffF0F9F3),
      surfaceContainer: Color(0xffE0F2E7),

      surfaceTint: Color(0xFF169056),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
    );
  }

  static ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      
      primary: Color(0xFF3DB978), // Brighter green for dark mode
      onPrimary: Color(0xff272A28),
      primaryContainer: Color(0xFF07452B),
      onPrimaryContainer: Color(0xffD5EDE0),

      // Secondary Colors
      secondary: Color(0xFF2DC1AD), // Brighter teal for dark mode
      onSecondary: Color(0xff272A29),
      secondaryContainer: Color(0xFF073D35),
      onSecondaryContainer: Color(0xFFD0F0EB),

      // Tertiary Colors
      tertiary: Color(0xFFA5D12E), // Brighter olive for dark mode
      onTertiary: Color(0xFF262807),
      tertiaryContainer: Color(0xFF3D4E07),
      onTertiaryContainer: Color(0xFFE5F2D0),

      error: Color(0xffcf6679),
      onError: Color(0xff370000),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffe0e0),

      surface: Color(0xff181B19),
      onSurface: Color(0xffE4E7E4),
      onSurfaceVariant: Color(0xffA1AAA1),
      outline: Color(0xff717A71),

      inverseSurface: Color(0xffDAD9D8),
      inversePrimary: Color(0xFF3DB978),

      surfaceContainerLowest: Color(0xff0F110F),
      surfaceContainerLow: Color(0xff181B19),
      surfaceContainer: Color(0xff1E211E),

      surfaceTint: Color(0xFF3DB978),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
        brightness: colorScheme.brightness,
        dividerTheme: DividerThemeData(
          color: colorScheme.surface,
        ),
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
        
        textTheme: textTheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
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
