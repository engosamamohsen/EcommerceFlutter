import 'package:auth/network/provider.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio? _dio;
  // final ProgressProvider _progressProvider;

  ApiService() {
     _dio = Dio(
      BaseOptions(
        baseUrl: "https://ceraj.cashierthru.com/api/",
        receiveTimeout: const Duration(minutes: 1),
        connectTimeout: const Duration(minutes: 1),
        receiveDataWhenStatusError: true,

      )
     );
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Show progress or loader here
        print('Request started');
                // _progressProvider.showProgress();
        handler.next(options);
      },
      onResponse: (response, handler) {
        // Hide progress or loader here
                // _progressProvider.hideProgress();
        print('Request successful');
        handler.next(response);
      },
      onError: (DioException error, handler) {
        // Hide progress or loader here
        print('Request failed:' + error.message.toString() + "," + error.error.toString());
                // _progressProvider.hideProgress();
        _handleError(error);
        handler.next(error);
      },
    ));
  }

  // Generic GET request
  Future<Response?> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio!.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      // Handle DioError here or rethrow
      rethrow;
    }
  }

  // Generic POST request
  Future<Response?> post(String endpoint, Map<String, dynamic>? data) async {
    try {
      print("call api");
      Response response = await _dio!.post(endpoint, data: data);
      return response;
    } catch (e) {
      print("exce "+e.toString());
      // Handle DioError here or rethrow
    }
    return null;
  }

  // Handle errors globally
  void _handleError(DioException error) {
    if (error.response != null) {
      // Error from server
      print('Server error: ${error.response?.statusCode} ${error.response?.data}');
    } else {
      // Error during the request setup or due to connectivity
      print('Request error: ${error.message}');
    }
  }
}