part of 'review_bloc.dart';

@immutable
 class ReviewState {
  final String review;
  final bool? isLoading;
  final String? errorMessage;

  ReviewState({this.errorMessage, this.review = '', this.isLoading});

  factory ReviewState.initial() => ReviewState();
  factory ReviewState.updateReview(String review) => ReviewState(review: review);
  factory ReviewState.started(String review) => ReviewState(isLoading: true, errorMessage: null,review: review);
  factory ReviewState.hasError(String review, String message) => ReviewState(isLoading: false, errorMessage: message, review: review);
  factory ReviewState.successUpload(String review) => ReviewState(isLoading: false, errorMessage: null, review: review);
  
 }


