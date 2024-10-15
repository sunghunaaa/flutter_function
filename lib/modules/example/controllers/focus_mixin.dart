import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

mixin FocusMixin {
  ///Focus이지만 실제 focus가 아님 단순 상태로 위젯 관리하는 것
  /// textField와 같이 사용
  List<RxBool> focusStatus = [];
  List<FocusNode> focusNodes = [];

  //inputTextArea
  RxBool inputTextAreaStatus = false.obs;
  FocusNode inputTextAreaFocus = FocusNode();

  // n개의 FocusNode와 상태를 초기화
  void initializeFocusNodes(int count) {
    focusStatus = List<RxBool>.generate(count, (_) => false.obs);
    focusNodes = List<FocusNode>.generate(count, (_) => FocusNode());

    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        if(focusNodes[i].hasFocus){
          focusStatus[i].value = true;
        }
      });
    }
    inputTextAreaFocus.addListener(() {
      if(inputTextAreaFocus.hasFocus){
        for(RxBool focus in focusStatus){
          focus.value = false;
        }
        inputTextAreaStatus.value = true;
      }
    });
  }

  // 각 FocusNode의 포커스 상태를 설정
  void setFocus({int? focusIndex, bool? hasFocus, bool? isInput = false}) {
    for(RxBool focus in focusStatus){
      focus.value = false;
    }
    if(!isInput! && focusIndex != null && hasFocus != null){
      inputTextAreaStatus.value = false;
      focusStatus[focusIndex].value = hasFocus;
    }else{
      inputTextAreaStatus.value = true;
    }
  }

  void unFocus(){
    for(RxBool focus in focusStatus){
      focus.value = false;
    }
    inputTextAreaStatus.value = false;
  }
}