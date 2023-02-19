class ApiConstants{
  //base url
  static const String _baseUrl = 'https://blacksquad.dev.fegno.com';
  //Auth
  static const String signup = _baseUrl + '/api/v1/user/enter_mobile/';
  static const String otp = _baseUrl + '/api/v1/user/enter_otp/';
  //Rating
  static const String uploadRating = _baseUrl + '/api/v1/user/add-rating/';
  //Review
  static const String uploadReview = _baseUrl + '/api/v1/user/add-review/';
  //Home
  static const String home = _baseUrl + '/api/v1/fitness_center/fc/';
}