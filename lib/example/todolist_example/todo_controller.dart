import 'package:get/get.dart';
import 'package:getx_example1/example/todolist_example/todo_model.dart';

class TodoController extends GetxController {
  // 리스트도 .obs로 만들 수 있음
  var todos = <Todo>[].obs;

  void addTodo(String title) {
    if (title.trim().isNotEmpty) {
      // 리스트에 추가/삭제는 자동으로 UI 업데이트됨
      todos.add(Todo(title: title));
    }
  }

  void removeTodo(int index) {
    // 리스트에서 제거도 자동으로 UI 업데이트됨
    todos.removeAt(index);
  }

  void toggleComplete(int index) {
    // ⚠️ 중요: 리스트 안의 객체 속성을 변경할 때는 .refresh() 필요!
    // 리스트 자체는 변하지 않고 내부 객체만 변하기 때문
    todos[index].isCompleted = !todos[index].isCompleted;
    todos.refresh(); // UI 업데이트를 위해 수동으로 refresh 호출
  }

  void toggleFavorite(int index) {
    // 마찬가지로 객체 속성 변경 후 .refresh() 필요
    todos[index].isFavorite = !todos[index].isFavorite;
    todos.refresh();
  }
}