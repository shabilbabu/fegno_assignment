import 'package:json_annotation/json_annotation.dart';
part 'review_entity.g.dart';

@JsonSerializable()
class ReviewsEntity {
  ReviewsEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  factory ReviewsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReviewsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsEntityToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.id,
    this.user,
    this.review,
    this.rating,
  });

  final int? id;
  final int? user;
  final List<Review>? review;
  final int? rating;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Review {
  Review({
    this.user,
    this.review,
    this.rating,
    this.id,
  });

  final String? user;
  final String? review;
  final int? rating;
  final int? id;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
