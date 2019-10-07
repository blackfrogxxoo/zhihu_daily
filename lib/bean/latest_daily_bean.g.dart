// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_daily_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

latest_daily_bean _$latest_daily_beanFromJson(Map<String, dynamic> json) {
  return latest_daily_bean(
    json['date'] as String,
    (json['stories'] as List)
        ?.map((e) =>
            e == null ? null : Stories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['top_stories'] as List)
        ?.map((e) =>
            e == null ? null : Top_stories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$latest_daily_beanToJson(latest_daily_bean instance) =>
    <String, dynamic>{
      'date': instance.date,
      'stories': instance.stories,
      'top_stories': instance.topStories,
    };

Stories _$StoriesFromJson(Map<String, dynamic> json) {
  return Stories(
    json['image_hue'] as String,
    json['title'] as String,
    json['url'] as String,
    json['hint'] as String,
    json['ga_prefix'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['type'] as int,
    json['id'] as int,
  );
}

Map<String, dynamic> _$StoriesToJson(Stories instance) => <String, dynamic>{
      'image_hue': instance.imageHue,
      'title': instance.title,
      'url': instance.url,
      'hint': instance.hint,
      'ga_prefix': instance.gaPrefix,
      'images': instance.images,
      'type': instance.type,
      'id': instance.id,
    };

Top_stories _$Top_storiesFromJson(Map<String, dynamic> json) {
  return Top_stories(
    json['image_hue'] as String,
    json['hint'] as String,
    json['url'] as String,
    json['image'] as String,
    json['title'] as String,
    json['ga_prefix'] as String,
    json['type'] as int,
    json['id'] as int,
  );
}

Map<String, dynamic> _$Top_storiesToJson(Top_stories instance) =>
    <String, dynamic>{
      'image_hue': instance.imageHue,
      'hint': instance.hint,
      'url': instance.url,
      'image': instance.image,
      'title': instance.title,
      'ga_prefix': instance.gaPrefix,
      'type': instance.type,
      'id': instance.id,
    };
