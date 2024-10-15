import 'package:flutter_function/core/controller/core_controller.dart';
import 'package:flutter_function/modules/example/models/memo/memo_model.dart';
import 'package:flutter_function/modules/example/repository/memo_repository.dart';
import 'package:get/get.dart';

mixin MemoListGet on CoreController{
  final memoRepository = MemoRepository();

  RxList<Memo> memoList = RxList<Memo>();

  void fetch(){

  }

  Future<void> memoListGet() async {
    memoList.value = await memoRepository.memoListGet();
  }

}