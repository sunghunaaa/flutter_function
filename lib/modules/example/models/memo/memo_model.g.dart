// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      pk: (json['pk'] as num).toInt(),
      content: json['content'] as String,
      createBy: json['createBy'] as String,
      createAt: json['createAt'] as String,
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'content': instance.content,
      'createBy': instance.createBy,
      'createAt': instance.createAt,
    };
