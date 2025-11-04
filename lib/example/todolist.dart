// ============================================
// 예제 3: Todo 리스트
// ============================================
// 학습 목표:
// - List<T>.obs로 리스트를 반응형으로 만들기
// - 리스트에 항목 추가/삭제하기
// - .refresh()가 필요한 경우 이해하기

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Todo 모델
class Todo {
  String title;
  bool isCompleted;
  bool isFavorite;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.isFavorite = false,
  });
}

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

class TodolistPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(title: Text('예제 3: Todo 리스트')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: '할 일을 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    todoController.addTodo(textController.text);
                    textController.clear();
                  },
                  child: Text('추가'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Obx로 전체 리스트를 감싸서 todos가 변경되면 자동 업데이트
            Obx(
              () => Expanded(
                child: todoController.todos.isEmpty
                    ? Center(
                        child: Text(
                          '할 일이 없습니다',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: todoController.todos.length,
                        itemBuilder: (context, index) {
                          final todo = todoController.todos[index];
                          return listItem(todo, index);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card listItem(Todo todo, int index) {

    final todoController = Get.find<TodoController>();

    return Card(
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            todo.isCompleted
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: todo.isCompleted ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            todoController.toggleComplete(index);
          },
        ),
        title: Row(
          children: [
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 16,
                decoration: todo.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: todo.isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                todo.isFavorite ? Icons.star : Icons.star_border,
                color: todo.isFavorite ? Colors.yellow : Colors.grey,
              ),
              onPressed: () {
                todoController.toggleFavorite(index);
              },
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            todoController.removeTodo(index);
          },
        ),
        onTap: () {
          Get.to(() => TodoDetailPage(index: index));
        },
      ),
    );
  }
}

// Todo 상세 페이지
class TodoDetailPage extends StatelessWidget {
  final int index;

  TodoDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    // Get.find(): 이전에 Get.put()으로 등록한 컨트롤러를 찾아옴
    // 같은 인스턴스를 공유하므로 데이터도 공유됨
    final TodoController todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('할 일 상세'),

        actions: [
          Obx(() {
            final todo = todoController.todos[index];
            return IconButton(
              icon: Icon(
                todo.isFavorite ? Icons.star : Icons.star_border,
                color: todo.isFavorite ? Colors.yellow : Colors.grey,
              ),
              onPressed: () {
                todoController.toggleFavorite(index);
              },
            );
          }),
        ],
      ),
      // 전체 body를 Obx로 감싸서 todo 변경사항 반영
      body: Obx(() {
        final todo = todoController.todos[index];

        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목
              Text('할 일', style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(height: 10),
              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              SizedBox(height: 40),

              // 완료 여부
              GestureDetector(
                onTap: () {
                  todoController.toggleComplete(index);
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      todo.isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: todo.isCompleted ? Colors.green : Colors.grey,
                    ),
                    title: Text('완료 여부', style: TextStyle(fontSize: 18)),
                    subtitle: Text(
                      todo.isCompleted ? '완료됨' : '진행중',
                      style: TextStyle(
                        color: todo.isCompleted ? Colors.green : Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
