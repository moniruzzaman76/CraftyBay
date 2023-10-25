class Urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String categoryProduct = '$_baseUrl/CategoryList';
  static String getProductByCategory(int id) => '$_baseUrl/ListProductByCategory/$id';
  static String getProductByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static String createWishList(String id) => '$_baseUrl/CreateWishList/$id';
  static String productDetails(int id) => '$_baseUrl/ProductDetailsById/$id';
  static String createAddToCard = '$_baseUrl/CreateCartList';
  static String cardList = '$_baseUrl/CartList';
  static String deleteAddToCard(String id) => '$_baseUrl/DeleteCartList/$id';
  static String productWishList = '$_baseUrl/ProductWishList';
  static String createReview = '$_baseUrl/CreateProductReview';
  static String  productReviewList(int id) => '$_baseUrl/ListReviewByProduct/$id';
  static String  createProfile = '$_baseUrl/CreateProfile';
  static String  readProfile = '$_baseUrl/ReadProfile';
  static String  invoiceCreate = '$_baseUrl/InvoiceCreate';

}