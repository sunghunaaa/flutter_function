import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/focus_controller.dart';

class FocusContainerTextfield extends StatelessWidget {
  final FocusController focusController = Get.put(FocusController());

  /// 위젯 구성하면 됨

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Container Example"),
      ),
      body: GestureDetector(
        onTap: () {
          // 화면의 빈 공간 클릭 시 모든 포커스 해제
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContainer(1, focusController),
            SizedBox(height: 20),
            _buildContainer(2, focusController),
            SizedBox(height: 20),
            _buildContainer(3, focusController),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(int index, FocusController focusController) {
    return GestureDetector(
      onTap: () {
        // focusController.setFocus(index, true);
      },
      child: Focus(
        focusNode: focusController.focusNodes[index - 1],
        onFocusChange: (hasFocus) {
          // focusController.setFocus(index, hasFocus);  // 포커스 상태 업데이트
        },
        child: Obx(() {
          return Container(
            width: 200,
            height: 200,
            child: Center(
              child: Text(
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        }),
      ),
    );
  }
}
