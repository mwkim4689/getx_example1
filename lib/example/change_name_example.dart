// ============================================
// 예제 2: 이름 변경
// ============================================
// 학습 목표:
// - String 타입의 observable 사용하기
// - 여러 버튼에서 같은 상태 변경하기

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameController extends GetxController {
  // String도 .obs로 반응형으로 만들 수 있음
  var name = '홍길동'.obs;

  void changeName(String newName) {
    // 값을 변경하면 Obx가 자동으로 UI 업데이트
    name.value = newName;
  }
}

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = Get.put(NameController());

    return Scaffold(
      appBar: AppBar(title: Text('예제 2: 이름 변경')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('현재 이름:', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              Obx(
                () => Text(
                  nameController.name.value,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                onPressed: () => nameController.changeName('김철수'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('김철수', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () => nameController.changeName('이영희'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('이영희', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () => nameController.changeName('박민수'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('박민수', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
