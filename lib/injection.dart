import 'package:get_it/get_it.dart';
import 'package:quis_kebangsaan/src/data/datasources/firebase_rt_datasource.dart';
import 'package:quis_kebangsaan/src/data/repository/main_repository.dart';
import 'package:quis_kebangsaan/src/domain/repository/base_repository.dart';
import 'package:quis_kebangsaan/src/domain/usecases/get_all_topics.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';

final locator = GetIt.instance;

void init() {

  // =========== bloc ==============
  locator.registerFactory(
        () => DashboardBloc(
      locator(),
    ),
  );

  // ========= usecases ============
  locator.registerLazySingleton(() => GetAllTopics(locator()));


  // ======== repository ===========
  locator.registerLazySingleton<BaseRepository>(
        () => MainRepository(
      firebaseDataSource: locator(),
    ),
  );


  // ======== data source ==========
  locator.registerLazySingleton<BaseFirebaseDataSource>(
        () => FirebaseDataSourceImpl(),
  );
}