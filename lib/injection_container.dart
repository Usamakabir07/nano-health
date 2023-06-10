import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nano_health/infrastructure/home/home_repository.dart';
import 'package:nano_health/viewModels/home_view_model.dart';

import 'infrastructure/apiUtil/urls.dart';
import 'infrastructure/auth/api/login_api.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'infrastructure/catalog_facade_service.dart';
import 'infrastructure/home/api/shopping_items_api.dart';
import 'viewModels/auth_view_model.dart';

// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  //core
  await registerCoreComponents();

  //catalog
  registerCatalog();

  //viewModel
  registerViewModel();

  //repository
  registerRepository();

  //ApiCall
  registerApiCalls();
}

registerApiCalls() {
  serviceLocator.registerLazySingleton(() => LoginApi(
        dio: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => GetShoppingItemApi(
        dio: serviceLocator(),
      ));
}

registerViewModel() {
  serviceLocator.registerLazySingleton(() => AuthViewModel(
        catalogFacadeService: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => HomeViewModel(
        catalogFacadeService: serviceLocator(),
      ));
}

registerRepository() {
  serviceLocator.registerLazySingleton(() => AuthRepository(
        loginApi: serviceLocator(),
        shoppingItemApi: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => HomeRepository(
        getShoppingItemApi: serviceLocator(),
      ));
}

registerCatalog() {
  serviceLocator.registerLazySingleton(() => CatalogFacadeService(
        authRepository: serviceLocator(),
        homeRepository: serviceLocator(),
      ));
}

registerCoreComponents() async {
  serviceLocator.registerLazySingleton(() => getNetworkObj());
}

Dio getNetworkObj() {
  BaseOptions options = BaseOptions(
    baseUrl: Urls.kBaseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        handler.next(options);
      },
    ),
  );
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 120,
  ));
  return dio;
}
