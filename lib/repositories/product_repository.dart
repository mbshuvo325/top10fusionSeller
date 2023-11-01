
import 'dart:convert';
import 'package:active_ecommerce_seller_app/app_config.dart';
import 'package:active_ecommerce_seller_app/data_model/common_response.dart';
import 'package:active_ecommerce_seller_app/data_model/product/attribute_response_model.dart';
import 'package:active_ecommerce_seller_app/data_model/product/brand_response_model.dart';
import 'package:active_ecommerce_seller_app/data_model/product/category_response_model.dart';
import 'package:active_ecommerce_seller_app/data_model/product/color_response_model.dart';
import 'package:active_ecommerce_seller_app/data_model/product/product_edit_response.dart';
import 'package:active_ecommerce_seller_app/data_model/product_delete_response.dart';
import 'package:active_ecommerce_seller_app/data_model/product_duplicate_response.dart';
import 'package:active_ecommerce_seller_app/data_model/product_for_coupon_response.dart';
import 'package:active_ecommerce_seller_app/data_model/product_review_response.dart';
import 'package:active_ecommerce_seller_app/data_model/products_response.dart';
import 'package:active_ecommerce_seller_app/data_model/remainig_product_response.dart';
import 'package:active_ecommerce_seller_app/data_model/whole_sale_product_details_response.dart';
import 'package:active_ecommerce_seller_app/helpers/shared_value_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductRepository{

  Future<ProductsResponse> getProducts(
      { name = "", page = 1}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/all"
        "?page=${page}&name=${name}");

    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    //print("product res  "+response.body.toString());
    return productsResponseFromJson(response.body);
  }

  Future<ProductsResponse> getWholesaleProducts(
      { name = "", page = 1}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/wholesale-products"
        "?page=${page}&name=${name}");

    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    return productsResponseFromJson(response.body);
  }





  Future<ProductEditResponse> productEdit({required id,lang="en"}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/edit/$id?lang=$lang");

    //print("product url "+url.toString());


    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    //print("product res  "+response.body.toString());
    return productEditResponseFromJson(response.body);
  }

  Future<WholesaleProductDetailsResponse> wholesaleProductEdit({required id,lang="en"}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/wholesale-product/edit/$id?lang=$lang");


    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    print("product res  "+response.body.toString());
    return wholesaleProductDetailsResponseFromJson(response.body);
  }

  Future<CommonResponse> addProductResponse(postBody)async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/add");

    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json",
      "Accept":"application/json"
    };

    //print(postBody);
    //print(access_token.$);


    final response = await http.post(url, headers:reqHeader,body: postBody
    );

    //print("product res  "+response.body.toString());

    return commonResponseFromJson(response.body);
  }

  Future<CommonResponse> updateProductResponse(postBody,productId,lang)async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/update/$productId?lang=$lang");
    //print(url.toString());

    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json",
      "Accept":"application/json"
    };

    //print(productId);
    //print(postBody);
    //print(access_token.$);


    final response = await http.post(url, headers:reqHeader,body: postBody
    );

    //print("product res  "+response.body.toString());

    return commonResponseFromJson(response.body);
  }

  Future<CommonResponse> updateWholesaleProductResponse(postBody,productId,lang)async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/wholesale-product/update/$productId?lang=$lang");
    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json",
      "Accept":"application/json"
    };
    final response = await http.post(url, headers:reqHeader,body: postBody);
print(response.body);
    return commonResponseFromJson(response.body);
  }

  Future<CommonResponse> addWholeSaleProductResponse(postBody)async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/wholesale-product/create");

    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json",
      "Accept":"application/json"
    };

    print(postBody);
    print(access_token.$);
    print(url.toString());


    final response = await http.post(url, headers:reqHeader,body: postBody
    );
    print(response.body);
    return commonResponseFromJson(response.body);

  }

  Future<CommonResponse> updateWholeSaleProductResponse(postBody,productId,lang)async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/update/$productId?lang=$lang");
    //print(url.toString());

    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json",
      "Accept":"application/json"
    };

    //print(productId);
    //print(postBody);
    //print(access_token.$);


    final response = await http.post(url, headers:reqHeader,body: postBody);

    //print("product res  "+response.body.toString());

    return commonResponseFromJson(response.body);
  }


  productDuplicateReq({required id})async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/product/duplicate/$id");


    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    //print("product res  "+response.body.toString());
    return productDuplicateResponseFromJson(response.body);
  }

  productDeleteReq({required id})async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/product/delete/$id");

    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    //print("product res  "+response.body.toString());
    return deleteProductFromJson(response.body);
  }

  wholesaleProductDeleteReq({required id})async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/wholesale-product/destroy/$id");

    final response = await http.get(url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    print("product res  "+response.body.toString());
    return deleteProductFromJson(response.body);
  }

  productStatusChangeReq({required id,status})async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/product/change-status");

    var post_body = jsonEncode({
      "id": id,
      "status":status
    });
    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.post(url, headers:reqHeader ,body: post_body
    );


    //print("product res  "+response.body.toString());
    return deleteProductFromJson(response.body);
  }

  productFeaturedChangeReq({required id,required featured})async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/product/change-featured");

    var post_body = jsonEncode({
      "id": id,
      "featured_status":featured
    });
    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.post(url, headers:reqHeader ,body: post_body
    );


    //print("product res  "+response.body.toString());
    return deleteProductFromJson(response.body);
  }

  remainingUploadProducts()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/remaining-uploads");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());
    return remainingProductFromJson(response.body);
  }



 Future<ProductReviewResponse> getProductReviewsReq()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/reviews");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());
    return productReviewResponseFromJson(response.body);
  }



 Future<CategoryResponse> getCategoryRes()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/categories");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());

    return categoryResponseFromJson(response.body);
  }

 Future<BrandResponse> getBrandRes()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/brands");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());

    return brandResponseFromJson(response.body);
  }


 Future<BrandResponse> getTaxRes()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/taxes");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());

    return brandResponseFromJson(response.body);
  }

 Future<AttributeResponse> getAttributeRes()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/attributes");


    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());

    return attributeResponseFromJson(response.body);
  }


 Future<ColorResponse> getColorsRes()async{
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/products/colors");

    var reqHeader={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type":"application/json"
    };

    final response = await http.get(url, headers:reqHeader
    );
    //print("product res  "+response.body.toString());

    return colorResponseFromJson(response.body);
  }



}