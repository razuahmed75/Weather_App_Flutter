// import 'package:flutter/foundation.dart';

// import '../models/ecomerce_product_model.dart';
// import '../services/product_detail.dart';

// class ProductData extends ChangeNotifier {
//   // loader
//   bool _isLoading = false;
//   get isLoading => _isLoading;

//   // create a object of ApiService class
//   ApiServices _apiServices = ApiServices();

//   // getting productData
//   List<ProductElement>? post;
//   Future<List<ProductElement>?> getPostData() async {
//     _isLoading = true;
//     post = await _apiServices.getProduct();
//     _isLoading = false;

//     notifyListeners();
//     return post;
//   }

//   // // getting passengerData
//   // PassengerDetail? passengerData;
//   // Future<void> getPassengerData() async {
//   //   _isLoading = true;
//   //   passengerData = await _apiServices.getPassenger();
//   //   _isLoading = false;

//   //   notifyListeners();
//   // }
// }
