import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
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
                color: Colors.blue,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("请登录")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("我的收藏"),
                        Text("离线下载"),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text("抽屉"),
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
