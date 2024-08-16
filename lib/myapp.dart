import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/general_bindings.dart';
import 'data/repositories/authentication_repository/authentication_repository.dart';
import 'features/authentication/screens/splash_screen/splash_screen.dart';
import 'localization/applang.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

/// -- Use This Class To Setup Themes , initialize Binding , any Animations and much more ---------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: Obx(
        () => AuthenticationRepository.instance.removeSplash.value
            ? const Scaffold(
                backgroundColor: TColors.primary,
                body: Center(
                  child: CircularProgressIndicator(
                    color: TColors.white,
                  ),
                ),
              )
            : const SplashScreen(),
      ),
    );
  }
}
