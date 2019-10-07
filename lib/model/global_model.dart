
import 'package:flutter/material.dart';
import 'package:zhihu_daily/model/main_model.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext context;
  MainPageModel mainPageModel;

  String appName = "知乎日报";

  GlobalModel() {

  }

  void setMainPageModel(MainPageModel model) {
    if (this.mainPageModel == null) {
      this.mainPageModel = mainPageModel;
    }
  }
}