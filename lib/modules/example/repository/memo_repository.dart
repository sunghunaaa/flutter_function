
import 'package:flutter_function/core/repository/core_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../mock/example/mock_data.dart';
import '../models/memo/memo_model.dart';

class MemoRepository {
  final CoreRepository coreRepository = Get.find<CoreRepository>();
  final _file = 'ConsultCardRepository';

  //GET /consultCard/memo/{consultCardPk} (pk로 상담카드 답변 조회)
  Future<List<Memo>> memoListGet() async {
    try {
        List<Map<String,Object>> list = mockData;
        return list.map((json) {
          return Memo.fromJson(json);
        }).toList();

    } catch (e) {
      Logger().e('getConsultCardAnswer: $e');
    }
    return [];
  }
}