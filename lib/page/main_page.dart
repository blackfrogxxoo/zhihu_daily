import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  _collection() {}

  _downloadOffline() {}

  _login() {}
  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(
                        left: 20, top: 12, right: 15, bottom: 12),
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
      body: Center(
        child: Text("内容"),
      ),
    );
  }
}
