import 'package:clean_architecture_template/domain/usecases/locale/get_locale_use_case.dart';
import 'package:clean_architecture_template/domain/usecases/themes/change_theme_use_case.dart';
import 'package:clean_architecture_template/domain/usecases/themes/get_theme_use_case.dart';

import '../domain/usecases/locale/change_locale_use_case.dart';
import 'di.dart';

void initUseCases() {
  di.registerLazySingleton(
    () => ChangeThemeUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetThemeUseCase(di()),
  );
  di.registerLazySingleton(
    () => GetLocaleUseCase(di()),
  );
  di.registerLazySingleton(
    () => ChangeLocaleUseCase(di()),
  );
}
