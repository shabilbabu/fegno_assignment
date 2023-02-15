import 'package:bloc/bloc.dart';
import 'package:fegno_assignment/application/rating/rating_bloc.dart';
import 'package:fegno_assignment/domain/repository/review_repo.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepo reviewRepo;
  ReviewBloc(this.reviewRepo) : super(ReviewState.initial()) {
    on<UploadReviewEvent>((event, emit) async {
      if(event.review.isEmpty){
        emit(ReviewState.hasError(event.review.toString(), 'Review field is required'));
      } else {
        ReviewState.started(event.review.toString());
        try{
          await reviewRepo.uploadReview(review: event.review);
          emit(ReviewState.successUpload(event.review.toString()));
        } catch (e) {
          emit(ReviewState.hasError(event.review.toString(), e.toString()));
        }
      }
    });
  }
}
