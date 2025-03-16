import 'package:json_annotation/json_annotation.dart';

part 'discover_item_dto.g.dart';

@JsonSerializable()
class DiscoverItemDto {
  String? name;
  String? rating;
  String? totalReviews;
  String? address;
  String? distance;
  List<String>? images;

  DiscoverItemDto({
    this.name,
    this.rating,
    this.totalReviews,
    this.address,
    this.distance,
    this.images,
  });

  factory DiscoverItemDto.fromJson(Map<String, dynamic> json) => _$DiscoverItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverItemDtoToJson(this);
}
