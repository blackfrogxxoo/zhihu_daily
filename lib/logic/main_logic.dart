import 'package:zhihu_daily/bean/latest_daily_bean.dart';
import 'package:zhihu_daily/config/api_service.dart';
import 'package:zhihu_daily/config/api_strategy.dart';
import 'package:zhihu_daily/model/global_model.dart';
import 'package:zhihu_daily/model/main_model.dart';

class MainPageLogic {
  final MainPageModel _model;

  MainPageLogic(this._model);

  // 请求最新日报
  Future retrieveLatestDaily() async {
    ApiService.instance.getLatestDaily(
        success: (latest_daily_bean bean) async {
          _model.latestDailyBean = bean;
          print(bean.toString());
          _model.refresh();
        },
        failed: (e) {
          print(e);
        },
        error: (msg) {
          print(msg);
        },
        token: CancelToken());
  }

  // 请求上一天日报
  void retrieveLastDaily(int page) {}
}
