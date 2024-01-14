import 'package:todo_list/core/base_routing/environment.dart';

class TodoListRouting {
  static const String baseName = 'v3';

  static String apiVariable = "c4749365-a1b1-4cb6-a5e4-0d8129bf7e80";
  static String todoListRoute =
      '${Environment.baseUrl}/$baseName/$apiVariable';
}
