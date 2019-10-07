import 'package:flutter/material.dart';
import 'package:zhihu_daily/bean/history_daily_bean.dart';
import 'package:zhihu_daily/bean/latest_daily_bean.dart';
import 'package:zhihu_daily/logic/main_logic.dart';
import 'package:zhihu_daily/model/global_model.dart';

class MainPageModel extends ChangeNotifier {
  MainPageLogic logic;
  BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  latest_daily_bean latestDailyBean;
  List<history_daily_bean> historyDailyBeans;

  GlobalModel _globalModel;

  MainPageModel() {
    logic = MainPageLogic(this);
  }

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if (this.context == null) {
      this.context = context;
      this._globalModel = globalModel;
      logic.retrieveLatestDaily().then((value) {
        refresh();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    scaffoldKey?.currentState?.dispose();
  }

  void refresh() {
    notifyListeners();
  }
}
