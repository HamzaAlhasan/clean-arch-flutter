import 'package:clean_arch_app/core/api/api_consumer.dart';
import 'package:clean_arch_app/core/api/dio_consumer.dart';
import 'package:clean_arch_app/features/auth/data/dataSource/remote_data_source.dart';
import 'package:clean_arch_app/features/auth/data/repositories/login_reposotory.dart';
import 'package:clean_arch_app/features/auth/domain/repositories/login_repostory.dart';
import 'package:clean_arch_app/features/auth/domain/useCases/login_use_cases.dart';
import 'package:clean_arch_app/features/auth/presentation/provider/login_provider.dart';
import 'package:clean_arch_app/features/instructor/data/dataSource/remote_data_source.dart';
import 'package:clean_arch_app/features/instructor/data/repositories/instructor_reposotory.dart';
import 'package:clean_arch_app/features/instructor/domain/repositories/instructor_repostory.dart';
import 'package:clean_arch_app/features/instructor/domain/useCases/instructor_use_cases.dart';
import 'package:clean_arch_app/features/instructor/presentation/provider/instructor_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: serviceLocator()),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiConsumer: serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(authRemoteDataSource: serviceLocator()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepository: serviceLocator()),
  );

  // Providers
  serviceLocator.registerFactory<LoginProvider>(
    () => LoginProvider(loginUseCase: serviceLocator()),
  );
  

  // Data Sources
  serviceLocator.registerLazySingleton<InstructorRemoteDataSource>(
    () => InstructorRemoteDataSource(apiConsumer: serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<InstructorRepository>(
    () => InstructorRepositoryImpl(instructorRemoteDataSource: serviceLocator()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<InstructorUseCase>(
    () => InstructorUseCase(instructorRepository: serviceLocator()),
  );

  // Providers
  serviceLocator.registerFactory<InstructorProvider>(
    () => InstructorProvider(instructorUseCase: serviceLocator()),
  );
} 