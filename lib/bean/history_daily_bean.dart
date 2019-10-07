import 'package:json_annotation/json_annotation.dart';

part 'history_daily_bean.g.dart';


@JsonSerializable()
class history_daily_bean extends Object {

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'stories')
  List<Stories> stories;

  history_daily_bean(this.date,this.stories,);

  factory history_daily_bean.fromJson(Map<String, dynamic> srcJson) => _$history_daily_beanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$history_daily_beanToJson(this);

}


@JsonSerializable()
class Stories extends Object {

  @JsonKey(name: 'image_hue')
  String imageHue;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'hint')
  String hint;

  @JsonKey(name: 'ga_prefix')
  String gaPrefix;

  @JsonKey(name: 'images')
  List<String> images;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  Stories(this.imageHue,this.title,this.url,this.hint,this.gaPrefix,this.images,this.type,this.id,);

  factory Stories.fromJson(Map<String, dynamic> srcJson) => _$StoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StoriesToJson(this);

}


