// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_daily_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

history_daily_bean _$history_daily_beanFromJson(Map<String, dynamic> json) {
  return history_daily_bean(
    json['date'] as String,
    (json['stories'] as List)
        ?.map((e) =>
            e == null ? null : Stories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$history_daily_beanToJson(history_daily_bean instance) =>
    <String, dynamic>{
      'date': instance.date,
      'stories': instance.stories,
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
