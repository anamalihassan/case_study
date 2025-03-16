import 'package:case_study/features/discover/boc/discover_bloc.dart';
import 'package:case_study/features/discover/data/repository/discover_repository.dart';
import 'package:case_study/features/discover/data/repository/mock_discover_repository_impl.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  injector.registerLazySingleton<DiscoverRepository>(() => MockDiscoverRepositoryImpl());

  injector.registerFactory(() => DiscoverBloc(repository: injector()));
}
