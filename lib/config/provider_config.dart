import 'package:provider/provider.dart';
import 'package:zhihu_daily/model/main_model.dart';
import 'package:zhihu_daily/page/main_page.dart';

class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if(_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();

  ChangeNotifierProvider<MainPageModel> getMainPage() {
    return ChangeNotifierProvider<MainPageModel>(
      builder: (context) => MainPageModel(),
      child: MainPage(),
    );
  }



}