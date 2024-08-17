import 'package:get_it/get_it.dart';
import 'package:hamdars/core/utils/network/web_service.dart';
import 'package:hamdars/data/repositories/hamdars_repository.dart';
import 'package:hamdars/data/web_provider/main_provider.dart';
import 'package:hamdars/domain/use_cases/hamdars_use_cases.dart';

final GetIt serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton<WebClient>(WebClient.new);
  serviceLocator.registerLazySingleton<HamDarsUseCases>(HamDarsUseCases.new);
  serviceLocator.registerLazySingleton<MainProvider>(MainProvider.new);
  serviceLocator.registerFactory<HamDarsRepository>(HamDarsRepository.new);
}
