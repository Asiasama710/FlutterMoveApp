import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moves_app/features/moves/presentation/view/moves_screen.dart';
import 'package:moves_app/shared/log_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/di.dart';
import 'design_system/app_colors.dart';
import 'design_system/app_text.dart';
import 'generated/l10n.dart';


GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  LogUtil.debugPrintOverride();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigateKey,
      title: "Moves App",
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: AppColorsTheme.dark().primary,
          secondary: AppColorsTheme.dark().secondary,
          background: AppColorsTheme.dark().background,
          error: AppColorsTheme.dark().error,
        ),
        extensions: [
          AppColorsTheme.dark(),
          AppTextsTheme.main(),
        ],
      ),
      supportedLocales: const [
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // locale: _locale,
      localeResolutionCallback: (currentLan, supportedLocales) {
        if (currentLan != null) {
          return currentLan;
        }
        return supportedLocales.first;
      },

      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MovesScreen()),
    );
  }
}


