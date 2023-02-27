import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fegno_assignment/domain/entity/review_entity.dart';
import 'package:fegno_assignment/domain/repository/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  ReviewsEntity? homeEntity;
  HomeBloc(this.homeRepo) : super(HomeState()) {
    on<GetReviewsEvent>((event, emit) async {
      try {
        emit(HomeState.started());
        homeEntity = await homeRepo.home();
        emit(HomeState.success(homeEntity!));
      } catch (e) {
        emit(HomeState.hasError(e.toString()));
      }
    });
  }
}
