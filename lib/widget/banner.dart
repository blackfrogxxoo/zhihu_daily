import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }

  void setText(String text) {
    this.text = text;
    setState(() {

    });
  }
}
