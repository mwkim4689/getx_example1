// Todo 상세 페이지
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example1/example/todolist_example/todo_controller.dart';

class TodoDetailPage extends StatelessWidget {
  final int index;

  const TodoDetailPage({super.key, required this.index});

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