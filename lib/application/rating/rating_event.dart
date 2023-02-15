part of 'rating_bloc.dart';

@immutable
abstract class RatingEvent {}


class UpdateRating extends RatingEvent{
  final int rating;

  UpdateRating({required this.rating});
}

class UploadRating extends RatingEvent{
   
}