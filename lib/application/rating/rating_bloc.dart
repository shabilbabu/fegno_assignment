import 'package:bloc/bloc.dart';
import 'package:fegno_assignment/domain/repository/rating_repo.dart';
import 'package:meta/meta.dart';
part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final RatingRepo ratingRepo;
  RatingBloc(this.ratingRepo) : super(RatingState.initial()) {
    on<UpdateRating>((event, emit) {
      emit(RatingState.updateRating(event.rating));
    });
    on<UploadRating>((event, emit) async {
      if (state.rating == 0) {
        emit(RatingState.hasError(
            state.rating, "Please select rating.."));
      } else {
        emit(RatingState.started(state.rating));
        try {
          await ratingRepo.uploadRating(rating: state.rating);
          emit(RatingState.uploadSuccess(state.rating));
        } catch (e) {
          emit(RatingState.hasError(state.rating, e.toString()));
        }
      }
    });
  }
}
