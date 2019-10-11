import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zhihu_daily/model/main_model.dart';
import 'package:zhihu_daily/widget/list_page.dart';

class MainPage extends StatelessWidget {
  MainPageModel model;

  _collection() {}

  _downloadOffline() {}

  _login() {}

  @override
  Widget build(BuildContext context) {
    model = Provider.of<MainPageModel>(context);
    model.setContext(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25),
                color: Colors.blue,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 12, top: 8, right: 12, bottom: 8),
                      child: InkWell(
                        onTap: _login,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 38,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "请登录",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(
                              left: 10, top: 10, right: 15, bottom: 10),
                          onPressed: _collection,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "我的收藏",
                                style: TextStyle(
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(
                              left: 10, top: 10, right: 15, bottom: 10),
                          onPressed: _downloadOffline,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.file_download,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "离线下载",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 12, right: 15, bottom: 12),
                  color: Colors.blueGrey[100],
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blue,
                          size: 22,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "首页",
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: model.latestDailyBean == null
          ? Text("")
          : ListPage(
              model.latestDailyBean.stories,
              headerList: model.latestDailyBean.topStories,
              itemWidgetCreator: getItemWidget,
              headerCreator: (BuildContext context, int position) {
                if (position == 0) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 9 / 16,
                    child: TransformerPageView(
                      loop: true,
                      itemCount: model?.latestDailyBean?.topStories?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            model.latestDailyBean.topStories[index].image,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width * 9 / 16,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  );
                } else if (position == 1) {
                  return new Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 14.0, bottom: 12.0),
                    child: Text(
                      '今日热闻',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 1,
                  );
                }
              },
            ),
    );
  }

  Widget getItemWidget(BuildContext context, int pos) {
    return new Card(
      elevation: 0.7,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      child: FlatButton(
        onPressed: () {
          _onItemClick(pos);
        },
        child: IntrinsicHeight(
          child: Container(
            height: 110.0,
            padding:
                EdgeInsets.only(left: 2.0, top: 12.0, right: 2.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  alignment: Alignment.topLeft,
                  child: Text(
                    model.latestDailyBean.stories[pos].title,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10 / 9,
                  child: Image.network(
                    model.latestDailyBean.stories[pos].images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemClick(int pos) async {
    String url = model.latestDailyBean.stories[pos].url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget getItemBottomWidget(int pos) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Text(
            "type${model.latestDailyBean.stories[pos].type}",
            style: TextStyle(
                color: Color(0xff979797),
                fontSize: 12.0,
                decoration: TextDecoration.none),
          )),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xfff1f1f1)),
                    borderRadius: BorderRadius.circular(3.0)),
                color: Color(0xfff1f1f1)),
            child: Text(
              "type${model.latestDailyBean.stories[pos].type}",
              style: TextStyle(
                  color: Color(0xff979797),
                  fontSize: 12.0,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
