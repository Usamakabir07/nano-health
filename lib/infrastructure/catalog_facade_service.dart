import 'package:nano_health/infrastructure/home/model/shopping_item.dart';

import 'auth/auth_repository.dart';
import 'home/home_repository.dart';

/// This class is the medium between repositories
/// and business logic which is provider in this case
/// business model request data from the catalog
/// and catalog redirect that request and retrieve
/// that data and emitted back to business model

class CatalogFacadeService {
  const CatalogFacadeService({
    required this.homeRepository,
    required this.authRepository,
  });

  final HomeRepository homeRepository;
  final AuthRepository authRepository;

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    return await authRepository.login(
      username: username,
      password: password,
    );
  }

  getAllItems() async {
    return await homeRepository.getAllItems();
  }
}
