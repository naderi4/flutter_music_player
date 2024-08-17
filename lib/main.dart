import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:SocialLib/audio_helpers/page_manager.dart';
import 'package:SocialLib/audio_helpers/service_locator.dart';
import 'package:SocialLib/common/color_extension.dart';
import 'package:SocialLib/view/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'articel/editor.dart';
import 'builder/articleFrom.dart';
import 'settings/cubit/settings_cubit.dart';
import 'view/songs/songs_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  FlutterQuillExtensions.useSuperClipboardPlugin();

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
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
        }));
  }
}
