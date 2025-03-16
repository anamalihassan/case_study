import 'package:case_study/features/discover/data/model/discover_item_dto.dart';

abstract class DiscoverRepository {
  Future<List<DiscoverItemDto>> fetchDiscoverWorkplacesData();
}
