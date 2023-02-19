import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fegno_assignment/domain/entity/review_entity.dart';
import 'package:fegno_assignment/shared/constants/api_constants.dart';

class HomeRepo{
  Future<ReviewsEntity> home() async {
    try{

      final response = await Dio().get(ApiConstants.home);
      final model = ReviewsEntity.fromJson(response.data);

      final listReviews = model.results!.firstWhere((element) => element.review!.isNotEmpty);
      log('************* ${listReviews.review}');
      log(response.toString());
      if(model.results != null){
        return model;
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    } on DioError catch (e) {
      if (e.message.contains('SocketException')) {
        throw 'Please make sure about your Connection!';
      } else {
        throw 'Something went wrong! Please try again later.';
      }
    }
  }
}