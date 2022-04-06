import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pick_office/src/core/ui/res/app_theme.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_screen.dart';

const expectedText = 'Укажите мест на карте...';
void main() {
  group(
    'Тесты на кнопку выбора места SelectPlaceButton',
    () {
      testWidgets(
        'Если кнопка неактивна, то надпись == $expectedText',
        (tester) async {
          final widget = withApp(
            SelectPlaceButton(
              enabled: false,
              onTap: () {
                debugPrint('dymmy');
              },
            ),
          );

          await tester.pumpWidget(widget);

          final f = find.text(expectedText);

          expect(
            f,
            findsOneWidget,
          );
        },
      );
    },
  );
}

//ignore: avoid-returning-widgets
Widget withApp(Widget child) => MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('RU', ''),
      ],

      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: AppTheme.theme,
      home: child,
    );
