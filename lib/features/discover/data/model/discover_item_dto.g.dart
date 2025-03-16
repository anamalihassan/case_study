// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverItemDto _$DiscoverItemDtoFromJson(Map<String, dynamic> json) =>
    DiscoverItemDto(
      name: json['name'] as String?,
      rating: json['rating'] as String?,
      totalReviews: json['totalReviews'] as String?,
      address: json['address'] as String?,
      distance: json['distance'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DiscoverItemDtoToJson(DiscoverItemDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'totalReviews': instance.totalReviews,
      'address': instance.address,
      'distance': instance.distance,
      'images': instance.images,
    };
