import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/Model/model_get_populer_movies.dart';
import 'package:movieapp/resource/app_string.dart';
import 'api_path.dart';



class ApiRepository {
  void showApiLog(String message) {
    print(message);
  }

  // Future<Map<String, String>> getHeaderWithToken() async {
  //   String? authToken = await AppPreference.readString(AppPreference.authToken);
  //
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'token': authToken!,
  //     'language': 'da'
  //   };
  //   return headers;
  // }

  // Login API
  // Future<ModelLogin?> loginApi(
  //     {required String userName,
  //       required String password,
  //
  //       VoidCallback? onNoInternet}) async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     if (onNoInternet != null) onNoInternet();
  //     return null;
  //   }
  //
  //   const String tag = 'login';
  //   ModelLogin? data;
  //   String? deviceType = '';
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo info = await deviceInfo.androidInfo;
  //     deviceType = "android";
  //   } else {
  //     IosDeviceInfo info = await deviceInfo.iosInfo;
  //     deviceType = "ios";
  //   }
  //
  //   var body = {
  //     ApiPath.userName: userName,
  //     ApiPath.passWord: password,
  //     ApiPath.deviceType: deviceType,
  //     // ApiPath.deviceToken:await getFcmToken(),
  //   };
  //   var rawBody = json.encode(body);
  //   showApiLog('$tag body: $rawBody');
  //
  //   var url = Uri.parse(ApiPath.login);
  //   showApiLog('$tag URL: $url');
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: body,
  //       //headers: {'Content-Type': 'application/json'},
  //     );
  //     showApiLog('$tag Response: Status Code: ${response.statusCode}');
  //     showApiLog('$tag Response: ${response.body}');
  //     var decodedResult = jsonDecode(response.body);
  //     data = ModelLogin.fromJson(decodedResult);
  //     return data;
  //   } on SocketException {
  //     showApiLog('$tag ${AppStrings.strNoInternetConnection}');
  //     return null;
  //   } catch (error) {
  //     showApiLog('$tag Error: ${error.toString()}');
  //     return null;
  //   }
  // }

  Future<ModelGetPopulerMovie?> getPopularMovie(
      { VoidCallback? onNoInternet}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
    const String tag = 'getPopularMovie';
    ModelGetPopulerMovie? data;

    // var headers = await getHeaderWithToken();
    // showApiLog('$tag header: $headers');
    var store = {'api_key':'9776330dc76bf80fa28e9cde5742a552'};
    String quaryString = Uri(queryParameters: store).query;
    var url = Uri.parse('${ApiPath.getUpcomingMovies}?$quaryString');
    showApiLog('$tag URL: $url');
    // Map<String, String> queryParams = {
    //   'api_key': '<<api_key>>',
    // };
    //var quaryString = Uri.parse(queryParams).query;
    try {
      var response = await http.get(url,);
      showApiLog('$tag Response: Status Code: ${response.statusCode}');
      showApiLog('$tag Response: ${response.body}');
      var decodedResult = jsonDecode(response.body);
      data = ModelGetPopulerMovie.fromJson(decodedResult);
      return data;
    } on SocketException {
      showApiLog('$tag ${AppStrings.strNoInternetConnection}');
      return null;
    } catch (error) {
      showApiLog('$tag Error: ${error.toString()}');
      return null;
    }
  }


}