// ============================================
// MVVM 패턴: View (Page)
// ============================================
// View는 UI만 담당합니다.
// Obx를 사용해서 State 변경을 자동으로 UI에 반영합니다.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_vm.dart';
import '../setting/setting_page.dart';

class ProfilePage extends StatelessWidget {
  // Controller 등록
  final ProfileVM profileVM = Get.put(ProfileVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('프로필 (MVVM 예제)'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx로 감싸서 state 변경을 자동 반영
            Obx(
              () => Column(
                children: [
                  // 이름 표시
                  Text(
                    '이름',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    profileVM.state.value.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 40),

                  // 나이 표시
                  Text(
                    '나이',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${profileVM.state.value.age}세',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            // 이름 변경 버튼들
            Text(
              '이름 변경',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => profileVM.updateName('김철수'),
                  child: Text('김철수'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => profileVM.updateName('이영희'),
                  child: Text('이영희'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => profileVM.updateName('박민수'),
                  child: Text('박민수'),
                ),
              ],
            ),

            SizedBox(height: 30),

            // 나이 조절 버튼들
            Text(
              '나이 조절',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: profileVM.decreaseAge,
                  icon: Icon(Icons.remove),
                  label: Text('-1'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: profileVM.increaseAge,
                  icon: Icon(Icons.add),
                  label: Text('+1'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),

            Spacer(),

            // 설정 페이지로 이동하는 톱니바퀴 아이콘
            Divider(),
            SizedBox(height: 10),
            Text(
              '설정 페이지로 이동',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 10),
            IconButton(
              onPressed: () {
                // Get.to()로 설정 페이지로 이동
                Get.to(() => SettingPage());
              },
              icon: Icon(Icons.settings),
              iconSize: 40,
              color: Colors.grey[700],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
