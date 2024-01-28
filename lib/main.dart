import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/audio_helpers/page_manager.dart';
import 'package:music_player/audio_helpers/service_locator.dart';
import 'package:music_player/common/color_extension.dart';
import 'package:music_player/view/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'articel/editor.dart';
import 'gallery/articleFrom.dart';
import 'view/songs/songs_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    super.dispose();
    getIt<PageManager>().dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
        Locale('ar'), // arabic
      ],
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      //supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        fontFamily: "Circular Std",
        scaffoldBackgroundColor: TColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: TColor.primaryText,
              displayColor: TColor.primaryText,
              decorationColor: TColor.primaryText,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
        ),
        useMaterial3: true,
        primaryColor: TColor.primary,
        //brightness: Brightness.light,
        // add tabBarTheme
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      // home: Scaffold(body: ArticelEditor()),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: SongsView()),
      //home: Scaffold(body: ArticelEditor()),
    );
  }
}
