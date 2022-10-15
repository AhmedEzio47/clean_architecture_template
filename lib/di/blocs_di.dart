import 'package:clean_architecture_template/di/di.dart';
import 'package:clean_architecture_template/presentation/app_view/blocs/locale/locale_bloc.dart';
import 'package:clean_architecture_template/presentation/app_view/blocs/theme/theme_bloc.dart';

void initBlocs() {
  di.registerFactory(
      () => ThemeBloc(changeThemeUseCase: di(), getThemeUseCase: di()));
  di.registerFactory(
      () => LocaleBloc(changeLocaleUseCase: di(), getLocaleUseCase: di()));
}
