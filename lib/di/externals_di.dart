import 'package:clean_architecture_template/di/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initExternals() {
  di.registerLazySingleton(() => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true)));
}
