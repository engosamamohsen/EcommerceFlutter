import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  Dio? _dio;
  AppStorage appStorage = AppStorage();
  // final ProgressProvider _progressProvider;
  final String base_url = "https://cashierthru.com/admin/public/api/v1/";
  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: base_url,
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      validateStatus: (status) {
        // Handle specific status codes
        return status! <
            500; // Handle status codes < 500 (e.g., 401, 403, etc.)
      },
    ));
    // Disable SSL certificate verification (development only)
    // (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   client.badCertificateCallback = (cert, host, port) => true;
    // };

    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Show progress or loader here
        print(options.path);
        // _progressProvider.showProgress();
        print("request:" + required.toString());
        appStorage.readToken().then((onValue) => {
              if (onValue != null && onValue.isNotEmpty)
                options.headers['Authorization'] = "Bearer $onValue"
            });

        handler.next(options);
      },
      onResponse: (response, handler) {
        // Hide progress or loader here
        // _progressProvider.hideProgress();
        if (response.statusCode != 200) {
          handleStatusCode(response.statusCode!, response.data["message"]);
        }
        handler.next(response);
      },
      onError: (DioException error, handler) {
        // Hide progress or loader here
        // _progressProvider.hideProgress();
        _handleError(error);
        handler.next(error);
      },
    ));
    _dio!.interceptors.add(LogInterceptor(
      request: true, // Log request
      requestHeader: true, // Log request header
      requestBody: true, // Log request body
      responseHeader: true, // Log response header
      responseBody: true, // Log response body
      error: true, // Log errors
      logPrint: (obj) =>
          print("server==>$obj"), // You can customize how the log is printed
    ));
  }

  // Generic GET request
  Future<Response?> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _dio!.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      // print("start post response DioError catch ${e}");
      handleStatusCode(e.response?.statusCode ?? 0, e.toString());
    } catch (e) {
      // Handle DioError here or rethrow
      // rethrow;

      // print("start post response catch ${e}");
      handleStatusCode(0, e.toString());
    }
    return null;
  }

  // Generic POST request
  Future<Response?> post(String endpoint, Map<String, dynamic>? data) async {
    // print("start post call");
    try {
      Response response = await _dio!.post(endpoint, data: data);
      // print("start post response");
      return response;
    } on DioException catch (e) {
      // print("start post response DioError catch ${e}");
      handleStatusCode(e.response?.statusCode ?? 0, e.toString());
    } catch (e) {
      // print("start post response catch");
      handleStatusCode(0, e.toString());
      // Handle DioError here or rethrow
    }
    // print("start post null");
    return null;
  }

  // Handle errors globally
  void _handleError(DioException error) {
    if (error.response != null) {
      // Error from server
      // print(
      //     'Server error: ${error.response?.statusCode} ${error.response?.data}');
    } else {
      // Error during the request setup or due to connectivity
      // print('Request error: ${error.message}');
    }
  }

  void handleStatusCode(int statusCode, String message) {
    // print("jsonHandleError:"+responseData);
    // Decode JSON response to a Map
    try {
      // Use the extracted data
      ToastMessageHelper.showErrorMessage(message.toString());
    } catch (e) {
      // print("Parsing error: ${e.toString()}");
    }
  }
}
