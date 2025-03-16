import 'package:equatable/equatable.dart';

abstract class DiscoverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDiscoverWorkplacesDataEvent extends DiscoverEvent {}

class FetchDiscoverHeaderPromotionDataEvent extends DiscoverEvent {}
