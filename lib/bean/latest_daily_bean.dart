import 'package:json_annotation/json_annotation.dart';

part 'latest_daily_bean.g.dart';


@JsonSerializable()
class latest_daily_bean extends Object {

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'stories')
  List<Stories> stories;

  @JsonKey(name: 'top_stories')
  List<Top_stories> topStories;

  latest_daily_bean(this.date,this.stories,this.topStories,);

  factory latest_daily_bean.fromJson(Map<String, dynamic> srcJson) => _$latest_daily_beanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$latest_daily_beanToJson(this);

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


@JsonSerializable()
class Top_stories extends Object {

  @JsonKey(name: 'image_hue')
  String imageHue;

  @JsonKey(name: 'hint')
  String hint;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'ga_prefix')
  String gaPrefix;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  Top_stories(this.imageHue,this.hint,this.url,this.image,this.title,this.gaPrefix,this.type,this.id,);

  factory Top_stories.fromJson(Map<String, dynamic> srcJson) => _$Top_storiesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Top_storiesToJson(this);

}


