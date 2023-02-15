part of 'rating_bloc.dart';

 class RatingState {
  final int rating;
  final bool? isLoading;
  final String? errorMessage;
  final bool updated;

  RatingState({this.errorMessage, this.rating = 0, this.isLoading, this.updated = false});

  factory RatingState.initial() => RatingState();
  factory RatingState.updateRating(int rating) => RatingState(rating: rating);
  factory RatingState.started(int rating) => RatingState(isLoading: true, errorMessage: null,rating: rating);
  factory RatingState.hasError(int rating, String message) => RatingState(isLoading: false, errorMessage: message,rating: rating);
  factory RatingState.uploadSuccess(int rating) => RatingState(isLoading: false, errorMessage: null,rating: rating, updated: true);

 }

