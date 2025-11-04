// ============================================
// 예제 1: 카운터
// ============================================
// 학습 목표:
// - .obs로 반응형 상태 만들기
// - Obx 위젯으로 UI 자동 업데이트하기
// - Get.put()으로 컨트롤러 등록하기

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {
  // .obs: 변수를 관찰 가능한(observable) 상태로 만듦
  // count가 변경되면 Obx 위젯이 자동으로 UI를 업데이트함
  var count = 0.obs;

  void increment() {
    // .value로 실제 값에 접근하고 변경
    count.value++;
  }
}

class CounterPage extends StatelessWidget {
  // Get.put(): 컨트롤러를 GetX에 등록
  // 이후 Get.find()로 어디서든 이 컨트롤러에 접근 가능
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('예제 1: 카운터')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('버튼을 누른 횟수:', style: TextStyle(fontSize: 20)),

            // Obx: 안에 있는 observable 변수(.obs)가 변경되면 자동으로 위젯 재빌드
            // setState() 없이도 UI가 자동으로 업데이트됨!
            Obx(
              () => Text(
                '${counterController.count.value}',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20),

            FloatingActionButton(
              onPressed: counterController.increment,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}



class SomePage extends StatelessWidget {
  const SomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(CounterController());
    return Obx(() => Text('${controller.count}'));

    
  }
  
}