import 'database.dart';
import 'todo.dart';

main(List<String> args) {
  Todo item = new Todo();
  item.title = "Merhaba";
  item.complete = 0;
  Add(item);

  List<Todo> todos = GetAll();
  for (Todo item in todos) {
    print(item.title);
  }
}
