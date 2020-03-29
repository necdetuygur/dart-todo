import 'package:sqlite3/sqlite.dart';
import 'todo.dart';

Database Connect() {
  Database d = Database("database1.db");
  d.execute("CREATE TABLE IF NOT EXISTS todos(id INTEGER PRIMARY KEY, title TEXT, complete INTEGER)");
  return d;
}

void Add(Todo item) {
  final Database db = Connect();
  db.execute("INSERT INTO todos (title, complete) VALUES ('${item.title}', '${item.complete}');");
  db.close();
}

List<Todo> GetAll() {
  List<Todo> ret = new List<Todo>();
  final Database db = Connect();
  Result result = db.query("SELECT * FROM todos LIMIT 9999;");
  for (Row r in result) {
    Todo todo = new Todo();
    int id = r.readColumnAsInt("id");
    String title = r.readColumn("title");
    int complete = r.readColumnAsInt("complete");
    todo.id = id;
    todo.title = title;
    todo.complete = complete;
    ret.add(todo);
  }
  db.close();
  return ret;
}

void Del(int id) {
  final Database db = Connect();
  db.execute("DELETE FROM todos WHERE id = $id;");
  db.close();
}

void Set(Todo item) {
  final Database db = Connect();
  db.execute("UPDATE todos SET title = '${item.title}', complete = '${item.complete}' WHERE id = ${item.id};");
  db.close();
}
