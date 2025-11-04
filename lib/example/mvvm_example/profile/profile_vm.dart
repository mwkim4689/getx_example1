// ============================================
// MVVM 패턴: ViewModel (Controller)
// ============================================
// ViewModel은 비즈니스 로직과 상태 관리를 담당합니다.
// Model(State)을 .obs로 감싸서 반응형으로 만듭니다.

import 'package:get/get.dart';
import 'profile_state.dart';

class ProfileVM extends GetxController {
  // State를 .obs로 만들어 반응형 상태로 관리
  // State가 변경되면 Obx가 자동으로 UI 업데이트
  var state = ProfileState(name: '홍길동', age: 25).obs;

  // 비즈니스 로직: 이름 변경
  void updateName(String newName) {
    // state 전체를 새로운 객체로 교체
    state.value = state.value.copyWith(name: newName);
  }

  // 비즈니스 로직: 나이 증가
  void increaseAge() {
    state.value = state.value.copyWith(age: state.value.age + 1);
  }

  // 비즈니스 로직: 나이 감소
  void decreaseAge() {
    if (state.value.age > 0) {
      state.value = state.value.copyWith(age: state.value.age - 1);
    }
  }
}
