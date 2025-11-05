// ============================================
// 예제 3: Todo 리스트
// ============================================
// 학습 목표:
// - List<T>.obs로 리스트를 반응형으로 만들기
// - 리스트에 항목 추가/삭제하기
// - .refresh()가 필요한 경우 이해하기

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example1/example/todolist_example/todo_controller.dart';
import 'package:getx_example1/example/todolist_example/todo_detail_page.dart';
import 'package:getx_example1/example/todolist_example/todo_model.dart';



class TodolistPage extends StatelessWidget {
  TodolistPage({super.key});

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
