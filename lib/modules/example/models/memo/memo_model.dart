import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_model.freezed.dart';
part 'memo_model.g.dart';

@freezed
class Memo with _$Memo {
  factory Memo({
    required int pk,
    required String content,
    required String createBy,
    required String createAt,
  }) = _Memo;
  const Memo._();

  factory Memo.fromJson(Map<String, dynamic> json) =>
      _$MemoFromJson(json);
}
