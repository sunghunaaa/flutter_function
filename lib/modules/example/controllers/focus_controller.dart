import 'package:flutter/material.dart';
import 'package:flutter_function/modules/example/controllers/focus_mixin.dart';
import 'package:get/get.dart';

class FocusController extends GetxController with FocusMixin {



  @override
  void onClose() {
    // 모든 FocusNode 해제
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
