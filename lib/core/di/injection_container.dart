import '../../data/datasources/wheel_local_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/repositories/wheel_repository_impl.dart';
import '../../domain/repositories/wheel_repository.dart';
import '../../domain/usecases/spin_wheel_usecase.dart';
import '../../presentation/blocs/wheel/wheel_bloc.dart';

// ========================================
// DEPENDENCY INJECTION CONTAINER
// ========================================
final GetIt sl = GetIt.instance;

// ========================================
// INITIALIZATION METHOD
// ========================================
Future<void> init() async {
  // ========================================
  // BLOC REGISTRATION
  // ========================================
  _registerBlocs();

  // ========================================
  // USE CASES REGISTRATION
  // ========================================
  _registerUseCases();

  // ========================================
  // REPOSITORY REGISTRATION
  // ========================================
  _registerRepositories();

  // ========================================
  // DATA SOURCES REGISTRATION
  // ========================================
  _registerDataSources();

  // ========================================
  // EXTERNAL DEPENDENCIES REGISTRATION
  // ========================================
  _registerExternalDependencies();
}

// ========================================
// BLOC REGISTRATION METHODS
// ========================================
void _registerBlocs() {
  sl.registerFactory(
    () => WheelBloc(spinWheelUseCase: sl(), wheelRepository: sl()),
  );
}

// ========================================
// USE CASES REGISTRATION METHODS
// ========================================
void _registerUseCases() {
  // ========================================
  // WHEEL SPIN USE CASES
  // ========================================
  sl.registerLazySingleton(() => SpinWheelUseCase(sl()));

  // ========================================
  // SEGMENT MANAGEMENT USE CASES
  // ========================================
  sl.registerLazySingleton(() => UpdateWheelSegmentsUseCase(sl()));

  // ========================================
  // WHEEL SIZE USE CASES
  // ========================================
  sl.registerLazySingleton(() => GetWheelSizeUseCase(sl()));
  sl.registerLazySingleton(() => SaveWheelSizeUseCase(sl()));

  // ========================================
  // ANIMATION SPEED USE CASES
  // ========================================
  sl.registerLazySingleton(() => GetAnimationSpeedUseCase(sl()));
  sl.registerLazySingleton(() => SaveAnimationSpeedUseCase(sl()));
}

// ========================================
// REPOSITORY REGISTRATION METHODS
// ========================================
void _registerRepositories() {
  sl.registerLazySingleton<WheelRepository>(
    () => WheelRepositoryImpl(localDataSource: sl()),
  );
}

// ========================================
// DATA SOURCES REGISTRATION METHODS
// ========================================
void _registerDataSources() {
  sl.registerLazySingleton<WheelLocalDataSource>(
    () => WheelLocalDataSourceImpl(),
  );
}

// ========================================
// EXTERNAL DEPENDENCIES REGISTRATION METHODS
// ========================================
void _registerExternalDependencies() {
  sl.registerLazySingleton(() => Dio());
}
