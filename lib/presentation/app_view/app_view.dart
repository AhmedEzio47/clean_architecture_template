import 'package:clean_architecture_template/presentation/app_view/blocs/locale/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_colors.dart';
import '../../core/app_constants.dart';
import '../../core/locale/app_localization.dart';
import '../../core/locale/locale_constants.dart';
import '../../core/locale/locale_resolution_callback.dart';
import '../../core/themes/themes.dart';
import '../../di/di.dart';
import '../routes/app_routes.dart';
import 'blocs/theme/theme_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<ThemeBloc>(),
        ),
        BlocProvider(
          create: (_) => di<LocaleBloc>(),
        ),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title: AppConstants.appName,
                color: AppColors.primaryColor,
                // navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.generateRoute,
                initialRoute: AppRoutes.initialRoute,
                theme: Themes.buildTheme(
                    context: context,
                    theme: themeState.theme == ThemesValues.light
                        ? Themes.lightTheme
                        : Themes.darkTheme),
                locale: _locale(localeState),
                localizationsDelegates: localizationDelegates,
                localeResolutionCallback: getSelectedLang,
                supportedLocales: supportedLocale,
                // builder: (context, child) {
                //   return BlocListener<AuthBloc, AuthState>(
                //     listener: (context, authState) {
                //       switch (authState.status) {
                //         case AuthStatus.undetermined:
                //           if (!AppRoutes.isCurrent(AppRoutes.splash)) {
                //             _navigator.pushNamedAndRemoveUntil(
                //                 AppRoutes.splash, (route) => false);
                //           }
                //           break;
                //         case AuthStatus.authenticated:
                //           if (!authState.user!.emailVerified) {
                //             if (!AppRoutes.isCurrent(AppRoutes.activate)) {
                //               _navigator.pushNamedAndRemoveUntil(
                //                   AppRoutes.activate, (route) => false);
                //             }
                //             return;
                //           }
                //           if (!AppRoutes.isCurrent(AppRoutes.home)) {
                //             _navigator.pushNamedAndRemoveUntil(
                //                 AppRoutes.home, (route) => false);
                //           }
                //           context.read<NotificationsBloc>().add(
                //               GetDeviceTokenEvent());
                //           break;
                //         case AuthStatus.unauthenticated:
                //           if (AppRoutes.isCurrent(AppRoutes.register)) {
                //             return;
                //           }
                //           if (!AppRoutes.isCurrent(AppRoutes.login)) {
                //             _navigator.pushNamedAndRemoveUntil(
                //                 AppRoutes.login, (route) => false);
                //           }
                //           break;
                //         case AuthStatus.needActivation:
                //           if (!AppRoutes.isCurrent(AppRoutes.activate)) {
                //             _navigator.pushNamedAndRemoveUntil(
                //                 AppRoutes.activate, (route) => false);
                //           }
                //           break;
                //       }
                //     },
                //     child: child ?? Container(),
                //   );
                // },
              );
            },
          );
        },
      ),
    );
  }

  Locale _locale(LocaleState state) {
    if (state is ReadyLocaleState) {
      return AppLocalizations.langToLocale(state.locale);
    }
    return AppLocalizations.langToLocale(kDefaultLanguage);
  }
}
