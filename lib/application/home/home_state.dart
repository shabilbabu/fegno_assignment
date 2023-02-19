part of 'home_bloc.dart';

@immutable
 class HomeState {
  final bool? isLoading;
  final ReviewsEntity? reviewEntity;
  final String? errorMessage;

  HomeState({this.isLoading, this.reviewEntity, this.errorMessage});

  factory HomeState.initial() => HomeState();
  factory HomeState.started() =>  HomeState(isLoading: true, errorMessage: null, reviewEntity: null);
  factory HomeState.hasError(String message) => HomeState(isLoading: null, errorMessage: message, reviewEntity: null);
  factory HomeState.success(ReviewsEntity homeEntity) => HomeState(isLoading: false, errorMessage: null, reviewEntity: homeEntity);
 }


