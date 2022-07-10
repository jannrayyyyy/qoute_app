import 'package:get_it/get_it.dart';
import 'qoute_app/data/datasource/local_data_source.dart';
import 'qoute_app/data/datasource/remote_datasource.dart';
import 'qoute_app/data/repository/qoute_repository_implementation.dart';
import 'qoute_app/domain/repository/qoute_repository.dart';
import 'qoute_app/domain/usecase/add_favorite.dart';
import 'qoute_app/domain/usecase/fetch_favorite.dart';
import 'qoute_app/domain/usecase/get_qoute.dart';
import 'qoute_app/presentation/cubit/favorite_cubit/add_fav_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => FavCubit(sl(), sl()));
  sl.registerLazySingleton(() => FetchFavorite(repo: sl()));
  sl.registerLazySingleton(() => AddFavorite(repo: sl()));
  sl.registerLazySingleton(() => GetQoute(sl()));

  sl.registerLazySingleton<QouteRepository>(
      () => QouteRepositoryImplementation(sl(), sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
