import 'dart:convert';
import 'dart:math';

import 'package:zhihu_daily/bean/latest_daily_bean.dart';
import 'package:zhihu_daily/config/api_strategy.dart';

class ApiService {
  factory ApiService() => _getInstance();

  static ApiService get instance => _getInstance();
  static ApiService _instance;

  static final int SUCCEED = 0;
  static final int FAILED = 1;

  ApiService._internal() {}

  static ApiService _getInstance() {
    if (_instance == null) {
      _instance = ApiService._internal();
    }
    return _instance;
  }

  void getLatestDaily({
    Function success,
    Function failed,
    Function error,
    CancelToken token,
  }) {
    ApiStrategy.getInstance().get(ApiStrategy.getBaseUrl() + "latest", (data) {
      if (data.toString().contains("errors")) {
        failed(data.toString());
      } else {
        latest_daily_bean bean = latest_daily_bean.fromJson(data);
        print(bean.toString());
        success(bean);
      }
    }, token: token);
  }
}
