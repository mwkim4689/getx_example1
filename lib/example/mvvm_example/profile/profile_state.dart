// ============================================
// MVVM 패턴: Model (State)
// ============================================
// Model은 데이터 구조만 정의합니다.
// 비즈니스 로직이나 상태 관리는 포함하지 않습니다.

class ProfileState {
  // 프로필 데이터
  String name;
  int age;

  ProfileState({
    required this.name,
    required this.age,
  });

  // 데이터 복사를 위한 메서드 (불변성 유지용)
  ProfileState copyWith({
    String? name,
    int? age,
  }) {
    return ProfileState(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
