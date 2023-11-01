import 'dart:io';

import 'package:active_ecommerce_seller_app/data_model/common_response.dart';
import 'package:active_ecommerce_seller_app/data_model/uploaded_file_list_response.dart';
import 'package:active_ecommerce_seller_app/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:active_ecommerce_seller_app/app_config.dart';
import 'package:active_ecommerce_seller_app/data_model/profile_image_update_response.dart';
import 'package:flutter/material.dart';

class FileUploadRepository{

  Future<CommonResponse> fileUpload(File file) async {


    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/file/upload");

    Map<String,String> header={
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
      "Content-Type": "multipart/form-data; boundary=<calculated when request is sent>",
      "Accept": "*/*",
    };

    final httpReq = http.MultipartRequest("POST",url);
    httpReq.headers.addAll(header);



    final image = await http.MultipartFile.fromPath("aiz_file", file.path);

    httpReq.files.add(image);

    final response = await httpReq.send();
    var commonResponse = CommonResponse(result: false,message: "File upload failed");


    var responseDecode = await response.stream.bytesToString();



    if(response.statusCode==200){
      try {
        commonResponse = commonResponseFromJson(responseDecode);
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
    return commonResponse;
  }

    Future<UploadedFilesListResponse> getFiles(page,search,type,sort) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/file/all?page=$page&search=$search&type=$type&sort=$sort");
    final response = await http.get(url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer ${access_token.$}","App-Language": app_language.$!,});


    return uploadedFilesListResponseFromJson(response.body);
  }

    Future<CommonResponse> deleteFile(id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL_WITH_PREFIX}/file/delete/$id");
    final response = await http.get(url,
        headers: {"Content-Type": "application/json", "Authorization": "Bearer ${access_token.$}","App-Language": app_language.$!,});


    return commonResponseFromJson(response.body);
  }



}