import 'package:case_study/features/discover/data/model/discover_item_dto.dart';
import 'package:equatable/equatable.dart';

import '../../../core/exception/network_exception.dart';

abstract class DiscoverState extends Equatable {
  @override
  List<Object> get props => [];
}

class DiscoverInitial extends DiscoverState {}

class FetchDiscoverWorkplacesDataLoading extends DiscoverState {}

class FetchDiscoverHeaderPromotionDataLoading extends DiscoverState {}

class FetchDiscoverWorkplacesDataSuccess extends DiscoverState {
  final List<DiscoverItemDto> discoverItems;
  FetchDiscoverWorkplacesDataSuccess({
    required this.discoverItems,
  });
  @override
  List<Object> get props => [discoverItems];
}

class FetchDiscoverHeaderPromotionDataSuccess extends DiscoverState {
  final List<DiscoverItemDto> discoverItems;
  FetchDiscoverHeaderPromotionDataSuccess({
    required this.discoverItems,
  });
  @override
  List<Object> get props => [discoverItems];
}

class FetchDiscoverHeaderPromotionDataFailure extends DiscoverState {
  final NetworkException networkException;

  FetchDiscoverHeaderPromotionDataFailure({
    required this.networkException,
  });

  @override
  List<Object> get props => [networkException];
}

class FetchDiscoverWorkplacesDataFailure extends DiscoverState {
  final NetworkException networkException;

  FetchDiscoverWorkplacesDataFailure({
    required this.networkException,
  });

  @override
  List<Object> get props => [networkException];
}
