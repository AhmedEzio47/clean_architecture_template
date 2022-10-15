import 'package:clean_architecture_template/data/data_sources/local/storage/storage_data_source_impl.dart';
import 'package:clean_architecture_template/di/di.dart';

void initDataSources() {
  di.registerLazySingleton(() => StorageDataSourceImpl(di()));
}
