// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsEntity _$ReviewsEntityFromJson(Map<String, dynamic> json) =>
    ReviewsEntity(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsEntityToJson(ReviewsEntity instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      user: json['user'] as int?,
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      user: json['user'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
      'id': instance.id,
    };
