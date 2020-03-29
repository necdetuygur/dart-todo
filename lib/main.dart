import 'dart:convert';
import 'dart:io';
import 'database.dart';
import 'todo.dart';

main(List<String> args) {
  String input = "";
  while (input != "0") {
    Header();
    stdout.write("Your Selection: ");
    input = ReadLine();
    switch (input) {
      case "1":
        Todo item = new Todo();
        stdout.write("Title: ");
        item.title = ReadLine();
        Add(item);
        break;
      case "2":
        ListTodos();
        break;
      case "3":
        ListTodos();
        stdout.write("Delete ID: ");
        Todo item = new Todo();
        item.id = int.parse(ReadLine());
        Del(item);
        print("${item.id} Deleted");
        break;
      case "4":
        ListTodos();
        stdout.write("Update ID: ");
        Todo item = new Todo();
        item.id = int.parse(ReadLine());
        item = Get(item);
        stdout.write("${item.title} Change To: ");
        item.title = ReadLine();
        Set(item);
        print("${item.id} Updated");
        break;
      default:
    }
  }
}

void Header() {
  print("\n");
  print("1: Add");
  print("2: List");
  print("3: Delete");
  print("4: Update");
  print("0: Exit");
}

String ReadLine() {
  return stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
}

void ListTodos() {
  print("");
  List<Todo> todos = GetAll();
  for (Todo item in todos) {
    print("${item.id}: ${item.title}");
  }
  print("");
}
