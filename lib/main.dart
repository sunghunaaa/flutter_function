import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FocusContainerExample(),
    );
  }
}

class FocusController extends GetxController {
  var isFocused1 = false.obs;
  var isFocused2 = false.obs;
  var isFocused3 = false.obs;

  // FocusNode 리스트를 생성
  List<FocusNode> focusNodes = [FocusNode(), FocusNode(), FocusNode()];

  // 각 FocusNode의 포커스 상태를 설정
  void setFocus(int containerIndex, bool hasFocus) {
    focusNodes[containerIndex - 1].requestFocus();  // 포커스 요청
    switch (containerIndex) {
      case 1:
        isFocused1.value = hasFocus;
        isFocused2.value = false;
        isFocused3.value = false;
        break;
      case 2:
        isFocused1.value = false;
        isFocused2.value = hasFocus;
        isFocused3.value = false;
        break;
      case 3:
        isFocused1.value = false;
        isFocused2.value = false;
        isFocused3.value = hasFocus;
        break;
    }
  }

  @override
  void onClose() {
    // 모든 FocusNode 해제
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}

class FocusContainerExample extends StatelessWidget {
  final FocusController focusController = Get.put(FocusController());

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
        focusController.setFocus(index, true);
      },
      child: Focus(
        focusNode: focusController.focusNodes[index - 1],
        onFocusChange: (hasFocus) {
          focusController.setFocus(index, hasFocus);  // 포커스 상태 업데이트
        },
        child: Obx(() {
          return Container(
            width: 200,
            height: 200,
            color: _getColorForFocus(index, focusController),
            child: Center(
              child: Text(
                _getTextForFocus(index, focusController),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        }),
      ),
    );
  }

  Color _getColorForFocus(int index, FocusController focusController) {
    switch (index) {
      case 1:
        return focusController.isFocused1.value ? Colors.blue : Colors.grey;
      case 2:
        return focusController.isFocused2.value ? Colors.blue : Colors.grey;
      case 3:
        return focusController.isFocused3.value ? Colors.blue : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  String _getTextForFocus(int index, FocusController focusController) {
    switch (index) {
      case 1:
        return focusController.isFocused1.value ? "Focused 1" : "Not Focused";
      case 2:
        return focusController.isFocused2.value ? "Focused 2" : "Not Focused";
      case 3:
        return focusController.isFocused3.value ? "Focused 3" : "Not Focused";
      default:
        return "Not Focused";
    }
  }
}
