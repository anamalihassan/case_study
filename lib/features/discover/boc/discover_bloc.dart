import 'package:case_study/features/discover/data/repository/discover_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exception/network_exception.dart';
import 'discover_event.dart';
import 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final DiscoverRepository _repository;

  DiscoverBloc({required DiscoverRepository repository})
      : _repository = repository,
        super(DiscoverInitial()) {
    on<FetchDiscoverWorkplacesDataEvent>(mapFetchDiscoverWorkplacesDataEventToState);
  }

  Future<void> mapFetchDiscoverWorkplacesDataEventToState(
    FetchDiscoverWorkplacesDataEvent event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(FetchDiscoverWorkplacesDataLoading());
    try {
      final response = await _repository.fetchDiscoverWorkplacesData();
      emit(FetchDiscoverWorkplacesDataSuccess(discoverItems: response));
    } on NetworkException catch (e) {
      emit(FetchDiscoverWorkplacesDataFailure(networkException: e));
    } catch (err) {
      emit(FetchDiscoverWorkplacesDataFailure(networkException: NetworkException()));
    }
  }
}
