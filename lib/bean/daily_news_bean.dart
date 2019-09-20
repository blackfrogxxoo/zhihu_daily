import 'package:json_annotation/json_annotation.dart';

part 'daily_news_bean.g.dart';


@JsonSerializable()
class DailyNewsBean extends Object {

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'stories')
  List<Stories> stories;

  @JsonKey(name: 'top_stories')
  List<Top_stories> topStories;

  DailyNewsBean(this.date,this.stories,this.topStories,);

  factory DailyNewsBean.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

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


