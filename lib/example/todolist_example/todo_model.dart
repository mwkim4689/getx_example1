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