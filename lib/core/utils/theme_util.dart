import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

const Color homeColorTop = Color(0xFFC3D9FF);

Color defaultGray = TW3Colors.gray.shade400;
Color disabledColor = TW3Colors.gray.shade200;
const Color colorRed = Color(0xFFC11D1D);

Color infoColor = TW3Colors.gray.shade500;
Color successColor = TW3Colors.green.shade500;
Color warningColor = TW3Colors.amber.shade400;
Color failureColor = TW3Colors.red.shade500;

class ThemeSetup {
  final Color primaryColor;
  final Color appbarColor;
  ThemeSetup(this.primaryColor, this.appbarColor);

  ThemeData get defaultThemeData => ThemeData(
        canvasColor: Colors.white,
        textTheme: GoogleFonts.nunitoSansTextTheme(defaultTextTheme),
        primarySwatch: ThemeUtils.createMaterialColorFromShade500(primaryColor),
        scaffoldBackgroundColor: TW3Colors.orange.shade100,
        primaryColor: primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          focusColor: primaryColor,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: disabledColor, width: 0.8)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.8),
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: primaryColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor.withOpacity(0.2),
          selectionHandleColor: primaryColor, // Set the color of the selection handle
        ),
        cardTheme: CardTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        drawerTheme:
            const DrawerThemeData(backgroundColor: Colors.white, surfaceTintColor: Colors.white),
        navigationDrawerTheme: const NavigationDrawerThemeData(
            surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        dividerTheme: DividerThemeData(color: Colors.grey.shade300),
        dialogBackgroundColor: Colors.white,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: primaryColor, side: BorderSide(color: primaryColor)),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        datePickerTheme: DatePickerThemeData(
          cancelButtonStyle: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: TW3Colors.gray.shade800,
          ),
          confirmButtonStyle: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
          ),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          headerBackgroundColor: primaryColor,
          headerForegroundColor: Colors.white,
          dayBackgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            },
          ),
          todayBackgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            },
          ),
          todayForegroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return null;
            },
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: appbarColor,
          surfaceTintColor: appbarColor,
          shadowColor: Colors.black38,
          elevation: 2,
          titleTextStyle: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              fontSize: 18),
          iconTheme: IconThemeData(color: primaryColor),
        ),
        dialogTheme: DialogTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.inter(
            textStyle: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme:
                InputDecorationTheme(labelStyle: TextStyle(fontSize: 18, color: primaryColor)),
            textStyle: const TextStyle(color: Colors.black, fontSize: 16),
            menuStyle: MenuStyle(surfaceTintColor:
                WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white;
              }
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.white;
            }), backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white;
              }
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.white;
            }))),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
          unselectedLabelStyle: TextStyle(
            color: infoColor,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.nunitoSans().fontFamily,
          ),
          labelStyle: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.nunitoSans().fontFamily),
        ),
        popupMenuTheme:
            const PopupMenuThemeData(color: Colors.white, surfaceTintColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor, foregroundColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.resolveWith<double>(
              (Set<WidgetState> states) {
                return 0;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return TW3Colors.gray.shade500.withAlpha(50);
                }
                if (states.contains(WidgetState.selected)) {
                  return primaryColor.withOpacity(0.1);
                }
                if (states.contains(WidgetState.pressed)) {
                  return primaryColor.withOpacity(0.1);
                }
                return primaryColor;
              },
            ),
            shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return TW3Colors.gray.shade500.withAlpha(50);
                }
                if (states.contains(WidgetState.selected)) {
                  return primaryColor.withOpacity(0.1);
                }
                if (states.contains(WidgetState.hovered)) {
                  return primaryColor.withOpacity(0.1);
                }
                if (states.contains(WidgetState.focused)) {
                  return primaryColor.withOpacity(0.1);
                }
                if (states.contains(WidgetState.pressed)) {
                  return primaryColor.withOpacity(0.1);
                }

                return primaryColor;
              },
            ),
            splashFactory: InkSplash.splashFactory,
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
        primaryTextTheme: GoogleFonts.interTextTheme(),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
        ),
        unselectedWidgetColor: primaryColor,
        disabledColor: TW3Colors.gray.shade200,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return primaryColor;
            }
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return primaryColor.withAlpha(200);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            return primaryColor;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return Colors.white;
          }),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.resolveWith<double>(
              (Set<WidgetState> states) {
                return 0;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                return Colors.white;
              },
            ),
            shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return TW3Colors.gray.shade500.withAlpha(50);
                }
                if (states.contains(WidgetState.selected)) {
                  return primaryColor;
                }
                if (states.contains(WidgetState.hovered)) {
                  return primaryColor.withAlpha(170);
                }
                if (states.contains(WidgetState.pressed)) {
                  return primaryColor.withAlpha(100);
                }

                return primaryColor;
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return TW3Colors.gray.shade500.withAlpha(50);
                }
                if (states.contains(WidgetState.selected)) {
                  return primaryColor;
                }
                if (states.contains(WidgetState.hovered)) {
                  return primaryColor.withAlpha(170);
                }
                if (states.contains(WidgetState.pressed)) {
                  return primaryColor.withAlpha(100);
                }

                return primaryColor;
              },
            ),
            splashFactory: InkSplash.splashFactory,
          ),
        ),
      );

  static TextTheme defaultTextTheme = const TextTheme(
    titleLarge: headline6,
    headlineMedium: headline4,
    headlineSmall: headline5,
    displaySmall: headline3,
    displayMedium: headline2,
    displayLarge: headline1,
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
    titleMedium: subtitle1,
    titleSmall: subtitle2,
  );
}

class ThemeUtils {
  static MaterialColor createMaterialColorFromShade500(Color shade500) {
    final Map<int, Color> swatch = <int, Color>{
      50: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.1),
      100: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.2),
      200: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.3),
      300: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.4),
      400: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.5),
      500: shade500,
      600: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.7),
      700: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.8),
      800: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 0.9),
      900: Color.fromRGBO(shade500.red, shade500.green, shade500.green, 1.0),
    };

    return MaterialColor(shade500.value, swatch);
  }
}

const TextStyle headline6 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
);

const TextStyle headline5 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);

const TextStyle headline4 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
  color: Colors.black,
);

const TextStyle headline3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: Colors.black,
);

const TextStyle headline2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24.0,
  color: Colors.black,
);

const TextStyle headline1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 28.0,
  color: Colors.black,
);
const TextStyle bodyText1 = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);

const TextStyle bodyText2 = TextStyle(
  color: Colors.black,
  fontSize: 14,
);

const TextStyle subtitle1 = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);

const TextStyle subtitle2 = TextStyle(color: colorRed, fontSize: 13);
