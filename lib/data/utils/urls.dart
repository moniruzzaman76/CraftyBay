class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String categoryProduct = '$_baseUrl/CategoryList';
  static String getProductByCategory(int id) => '$_baseUrl/ListProductByCategory/$id';

  static String getProductByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static String createWishList(String productId) => '$_baseUrl/CreateWishList/$productId';
  static String productDetails(int id) => '$_baseUrl/ProductDetailsById/$id';
}