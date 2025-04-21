import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

final sl = GetIt.instance;

Future<void> iniatializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImplementation(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
}
