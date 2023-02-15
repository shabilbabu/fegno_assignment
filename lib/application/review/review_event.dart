part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class UploadReviewEvent extends ReviewEvent{
  final String review;

  UploadReviewEvent({required this.review});
}
