class Task {
  final String title;
  final bool isCompleted;
  Task({required this.title, required this.isCompleted});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      // 'description': description,
      'isCompleted' : isCompleted
      // add other properties here if needed
    };
  }
}