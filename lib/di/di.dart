import 'package:clean_architecture_template/di/blocs_di.dart';
import 'package:clean_architecture_template/di/data_sources_di.dart';
import 'package:clean_architecture_template/di/externals_di.dart';
import 'package:clean_architecture_template/di/repositories_di.dart';
import 'package:clean_architecture_template/di/use_cases_di.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

void init() async {
  initExternals();
  initDataSources();
  initRepositories();
  initUseCases();
  initBlocs();
}
