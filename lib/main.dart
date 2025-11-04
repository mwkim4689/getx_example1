// ============================================
// GetX .obs 학습 예제 모음
// ============================================
//
// 이 파일은 GetX의 반응형 상태관리를 배우기 위한 예제입니다.
//
// 핵심 개념:
// 1. .obs: 변수를 관찰 가능한 상태로 만들기
// 2. Obx: observable 변수가 변경되면 자동으로 UI 업데이트
// 3. Get.put(): 컨트롤러 등록
// 4. Get.find(): 등록된 컨트롤러 찾기
// 5. Get.to(): 페이지 이동
// 6. .refresh(): 객체 내부 속성 변경 시 수동 업데이트
// ============================================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example1/example/changeNameEx.dart';
import 'package:getx_example1/example/counter.dart';
import 'package:getx_example1/example/todolist.dart';
import 'package:getx_example1/example/mvvm_example/mvvm_main_page.dart';

void main() {
  // GetMaterialApp: GetX 기능을 사용하기 위해 MaterialApp 대신 사용
  runApp(GetMaterialApp(home: HomeScreen()));
}

// 홈 화면
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Obx 예제 모음'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'GetX Obx 예제',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Get.to(): context 없이 페이지 이동 가능
            ElevatedButton(
              onPressed: () => Get.to(() => CounterPage()),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text('예제 1: 카운터', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => Get.to(() => ChangeNamePage()),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text('예제 2: 이름 변경', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => Get.to(() => TodolistPage()),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text('예제 3: Todo 리스트', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => Get.to(() => MvvmMainPage()),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text('예제 4: MVVM 패턴', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}






