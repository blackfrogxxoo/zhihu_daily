import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

// 最新： https://news-at.zhihu.com/api/4/news/latest
// 历史： https://news-at.zhihu.com/api/4/news/before/20191005
class ApiStrategy {
  static ApiStrategy _instance;

  static final String baseUrl = "https://news-at.zhihu.com/api/4/news/";
  static const int connectTimeout = 10 * 1000; //连接超时时间为10秒
  static const int receiveTimeout = 15 * 10000; //响应超时时间为15秒

  Dio _client;

  static ApiStrategy getInstance() {
    if (_instance == null) {
      _instance = ApiStrategy._internal();
    }
    return _instance;
  }

  ApiStrategy._internal() {
    if (_client == null) {
      BaseOptions options = new BaseOptions();
      options.connectTimeout = connectTimeout;
      options.receiveTimeout = receiveTimeout;
      options.baseUrl = baseUrl;
      _client = Dio(options);
      _client.interceptors.add(LogInterceptor(
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      )); //开启请求日志
    }
  }

  Dio get client => _client;
  static const String GET = "get";
  static const String POST = "post";

  static String getBaseUrl() {
    return baseUrl;
  }

  //get请求
  void get(
    String url,
    Function callback, {
    Map<String, String> params,
    Function errorCallback,
    CancelToken token,
  }) async {
    _request(
      url,
      callback,
      method: GET,
      params: params,
      errorCallback: errorCallback,
      token: token,
    );
  }

  void _request(
    String url,
    Function callback, {
    String method,
    Map<String, String> params,
    FormData formData,
    Function errorCallback,
    ProgressCallback progressCallback,
    CancelToken token,
  }) async {
    if (params != null && params.isNotEmpty) {
      print("<net> params:" + params.toString());
    }

    String errorMsg = "";
    int statusCode;
    try {
      Response response;
      if(method == GET) {
        if(params != null && params.isNotEmpty) {
          response = await _client.get(
            url,
            queryParameters: params,
            cancelToken: token,
          );
        } else {
          response = await _client.get(
            url,
            cancelToken: token,
          );
        }
      } else {
        if(params != null && params.isNotEmpty || formData.isNotEmpty) {
          response = await _client.post(
            url,
            data: formData ?? new FormData.from(params),
            onSendProgress: progressCallback,
            cancelToken: token,
          );
        } else {
          response = await _client.post(
            url,
            cancelToken: token,
          );
        }
      }

      statusCode = response.statusCode;

      //处理错误部分
      if(statusCode < 0) {
        errorMsg = "网络请求错误，状态码：" + statusCode.toString();
        _handError(errorCallback, errorMsg);
        return;
      }

      if(callback != null) {
        callback(response.data);
      }
    } catch(e) {
      _handError(errorCallback, e.toString());
    }
  }

  static void _handError(Function errorCallback, String errorMsg) {
    if(errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg:" + errorMsg);
  }
}
