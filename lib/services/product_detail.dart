import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/data.dart';

import '../models/ecomerce_product_model.dart';

class ApiServices {
  // product services
  Future<ProductModel> getProduct() async {
    var baseUrl = "https://dummyjson.com";
    var endPointUrl = "/products";

    final url = Uri.parse("https://dummyjson.com/products");
    // final headers = {
    //   HttpHeaders.contentTypeHeader: "application/json",
    // };

    final response = await http.get(url);
    // var data = jsonDecode(response.body);
    var data = jsonDecode(response.body);
    var post;
    try {
      if (response.statusCode == 200) {
        // return data.products;
        post = ProductModel.fromJson(data);
        return post;
      } else {
        // return [];
        // return Product.fromJson(data);
      }
    } catch (e) {
      log(e.toString());
    }
    // return data.product;
    // return data.p
    return post;
    // return Product.fromJson(data);
  }

  // passenger services
  // Future<PassengerDetail?> getPassenger() async {
  //   var baseUrl = "https://api.instantwebtools.net/v1/";
  //   var apiUrl = "passenger?page=0&size=10";

  //   PassengerDetail? result;

  //   final url = Uri.parse(baseUrl + apiUrl);
  //   final headers = {
  //     HttpHeaders.contentTypeHeader: "application/json",
  //   };

  //   try {
  //     final response = await http.get(url, headers: headers);
  //     var data = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       result = PassengerDetail.fromJson(data);
  //       return result;
  //     } else {
  //       print("error");
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }

  //   return result;
  // }
}
