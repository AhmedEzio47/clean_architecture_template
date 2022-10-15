import 'package:clean_architecture_template/data/repositories/settings_repo_impl.dart';
import 'package:clean_architecture_template/di/di.dart';

void initRepositories() {
  di.registerLazySingleton(() => SettingsRepoImpl(di()));
}
