import 'dart:async';
import 'dart:ui';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transitions;
import 'package:get_storage/get_storage.dart';
import 'package:invesq/routes/routes.dart';
import 'package:invesq/ui/login_screen/view/login_screen.dart';
import 'package:invesq/utils/color_utils.dart';
import 'package:invesq/utils/constants.dart';
import 'package:invesq/utils/enum_utils.dart' show AppEnvironment;
import 'package:invesq/utils/environment_key_utils.dart';

import 'api/api_urls.dart';
import 'bloc_provider_observer/bloc_provider_observer.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(
      fileName: '${AppEnvironment.production.name.toString()}.env',
    );
    ApiUrls.baseUrl = dotenv.env[EnvironmentKeysUtils.apiUrl].toString();

    await ScreenUtil.ensureScreenSize();
    await GetStorage.init();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((value) {
      Bloc.observer = BlocProviderObserver();
      Bloc.transformer = sequential();
      runApp(const MyApp());
    });

    PlatformDispatcher.instance.onError = (error, stack) {
      print("$error, $stack");
      return true;
    };
  }, (error, stack) => print("$error, $stack"));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (screenContext, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          locale: const Locale('en', 'IN'),
          fallbackLocale: const Locale('en', 'IN'),
          title: dotenv.env[EnvironmentKeysUtils.appName].toString(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.light,
            fontFamily: poppins,
            primaryColor: ColorUtils.primaryColor,
            colorScheme: ColorScheme.fromSeed(
              surface: ColorUtils.whiteColor,
              seedColor: ColorUtils.primaryColor,
              error: ColorUtils.errorColor,
            ),
          ),
          builder: (builderContext, child) {
            ScreenUtil.init(builderContext);
            return MediaQuery(
              data: MediaQuery.of(
                builderContext,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          defaultTransition: transitions.Transition.fadeIn,
          initialRoute: LoginScreen.route,
          getPages: pages,
          navigatorObservers: [HeroController()],
        );
      },
    );
  }
}
